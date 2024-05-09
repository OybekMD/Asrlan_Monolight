package v1

import (
	"asrlan-monolight/api/helper/email"
	"asrlan-monolight/api/helper/hashing"
	"asrlan-monolight/api/models"
	"asrlan-monolight/api/tokens"
	"asrlan-monolight/memory"
	"asrlan-monolight/storage/repo"
	"context"
	"encoding/json"
	"fmt"

	// "asrlan-monolight/storage/repo"
	// "encoding/json"
	"log"
	"net/http"

	// "strconv"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/k0kubun/pp"
	"github.com/spf13/cast"
	"google.golang.org/protobuf/encoding/protojson"
)

// @Summary 	  Login
// @Description   This Api for login users login with email and username
// @Tags 		  Register
// @Accept 		  json
// @Produce 	  json
// @Param 		  login body models.LoginRequest true "LoginRequest"
// @Success 	  200 {object} models.LoginResponse
// @Success 	  400 {object} models.Error
// @Failure 	  500 {object} models.Error
// @Router 		  /v1/login [POST]
func (h *handlerV1) Login(ctx *gin.Context) {
	var (
		body        models.LoginRequest
		jspbMarshal protojson.MarshalOptions
	)
	jspbMarshal.UseProtoNames = true

	err := ctx.ShouldBindJSON(&body)
	duration, err := time.ParseDuration(h.cfg.CtxTimeout)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{
			"error": "Failed to bind json",
		})
		log.Println("Login Failed to bind json:", err.Error())
		return
	}

	pp.Println(body)

	ctxTime, cancel := context.WithTimeout(context.Background(), duration)
	defer cancel()

	response, err := h.storage.Login().Login(ctxTime, body.Email)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.WrongLoginOrPassword,
		})
		log.Println("Invalid login or password", err.Error())
		return
	}
	check := hashing.CheckPasswordHash(body.Password, response.Password)
	pp.Println(body.Password, response.Password)
	fmt.Println("adasdadsadsadsadsadadadasdasdasdas:", check)
	if !check {
		ctx.JSON(http.StatusBadRequest, models.Error{
			Message: models.WrongLoginOrPassword,
		})
		log.Println("failed to check password in loing", err.Error())
		return
	}

	isAdmin, err := h.storage.Admin().Get(ctxTime, body.Email)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.WrongLoginOrPassword,
		})
		log.Println("Invalid login or password", err.Error())
		return
	}

	if isAdmin {
		h.jwtHandler = tokens.JWTHandler{
			Sub:       body.Email,
			Iat:       cast.ToString(time.Now().Unix()),
			Role:      "admin",
			SigninKey: h.cfg.SigningKey,
			Timeout:   cast.ToInt(h.cfg.AccessTokenTimeout),
		}
	} else {
		h.jwtHandler = tokens.JWTHandler{
			Sub:       body.Email,
			Iat:       cast.ToString(time.Now().Unix()),
			Role:      "user",
			SigninKey: h.cfg.SigningKey,
			Timeout:   cast.ToInt(h.cfg.AccessTokenTimeout),
		}
	}
	accessToken, refreshToken, err := h.jwtHandler.GenerateAuthJWT()
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("failed to generate token", err.Error())
		return
	}

	// exist, err := h.storage.Login().SaveRefresh(ctxTime, response.Role, response.ID, refreshToken)
	// if err != nil || !exist {
	// 	ctx.JSON(http.StatusInternalServerError, models.Error{
	// 		Message: models.InternalMessage,
	// 	})
	// 	return
	// }

	ctx.JSON(http.StatusOK, models.LoginResponse{
		Id:        response.Id,
		Name:      response.Name,
		Username:  response.Username,
		Bio:       response.Bio,
		BirthDay:  response.BirthDay,
		Email:     response.Email,
		Avatar:    response.Avatar,
		Coint:     response.Coint,
		Score:     response.Score,
		CreatedAt: response.CreatedAt,
		Access:    accessToken,
		Refresh:   refreshToken,
	})
}

// @Summary 	  Signup
// @Description   This Api for sign
// @Tags 		  Register
// @Accept 		  json
// @Produce 	  json
// @Param 		  signup body models.Signup true "Signup"
// @Success 	  200 {object} models.AlertMessage
// @Success 	  400 {object} models.Error
// @Failure 	  500 {object} models.Error
// @Router 		  /v1/signup [POST]
func (h *handlerV1) Signup(ctx *gin.Context) {
	var (
		body        models.Signup
		jspbMarshal protojson.MarshalOptions
	)
	jspbMarshal.UseProtoNames = true

	err := ctx.ShouldBindJSON(&body)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{
			"error": "Failed to bind json",
		})
		log.Println("Signup failed ShouldBindJSON: ", err.Error())
		return
	}

	duration, err := time.ParseDuration(h.cfg.CtxTimeout)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("failed to parse timeout", err.Error())
		return
	}

	ctxTime, cancel := context.WithTimeout(context.Background(), duration)
	defer cancel()

	// Validation Start
	err = body.ValidateEmail()
	if err != nil {
		ctx.JSON(http.StatusUnauthorized, "Incorrect email for validation")
		log.Println("Error Incorrect email for validation: ", err.Error())
		return
	}
	err = body.ValidatePassword()
	if err != nil {
		ctx.JSON(http.StatusUnauthorized, "Incorrect password for validation password should have numbers and letters")
		log.Println("Error Incorrect password for validation: ", err.Error())
		return
	}
	// Validation End

	// Noexistense Start
	responseEmail, err := h.storage.User().CheckField(
		ctxTime, "email", body.Email)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"error": "Error while getting exist fild",
		})
		log.Println("Error while getting exist fild: ", err.Error())
		return
	}
	if responseEmail {
		ctx.JSON(http.StatusConflict, gin.H{
			"error": "Email already use",
		})
		log.Println("Email already use:", body.Email)
		return
	}

	responseUsername, err := h.storage.User().CheckField(
		ctxTime, "username", body.Username)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"error": "Error while getting exist fild",
		})
		log.Println("Error while getting exist fild: ", err.Error())
		return
	}
	if responseUsername {
		ctx.JSON(http.StatusConflict, gin.H{
			"error": "Username already use",
		})
		log.Println("Username already use:", body.Username)
		return
	}
	// Noexistense End

	otp := email.GenerateCode(6)
	if err := memory.Set(otp, &body); err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("failed to set code to redisdb", err.Error())
		return
	}

	Data := models.EmailData{
		Code: cast.ToString(otp),
	}

	err = email.SendEmailSignup([]string{body.Email}, "Asrlan Login OTP\n", *h.cfg, "./api/helper/email/signup.html", Data)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("failed to sending email", err.Error())
		return
	}

	ctx.JSON(http.StatusOK, models.AlertMessage{
		Message: "We sent verification password to your email. Check your email!",
	})
}

// @Summary 	  Verify Password
// @Description   This Api to check OTP
// @Tags 		  Register
// @Accept 		  json
// @Produce 	  json
// @Param 		  signup body models.VerifyRequest true "VerifyRequest"
// @Success 	  200 {object} bool
// @Failure 	  400 {object} models.Error
// @Failure 	  500 {object} models.Error
// @Router 		  /v1/verify [POST]
func (h *handlerV1) Verify(ctx *gin.Context) {
	var (
		body        models.VerifyRequest
		jspbMarshal protojson.MarshalOptions
	)
	jspbMarshal.UseProtoNames = true

	err := ctx.ShouldBindJSON(&body)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{
			"error": "Failed to bind json",
		})
		log.Println("Verify failed ShouldBindJSON: ", err.Error())
		return
	}

	duration, err := time.ParseDuration(h.cfg.CtxTimeout)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("failed to parse timeout", err.Error())
		return
	}

	ctxTime, cancel := context.WithTimeout(context.Background(), duration)
	defer cancel()

	getRedisUser, err := memory.Get(body.Otp)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: "while getting data from cashe",
		})
		log.Println("failed to set code to redisdb", err.Error())
		return
	}

	var redisUser models.Signup
	err = json.Unmarshal([]byte(getRedisUser), &redisUser)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: "Signup Unmarshaling error",
		})
		log.Println("Error Unmarshaling value to interface", err.Error())
		return
	}

	id, err := uuid.NewUUID()
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: "while making id error",
		})
		log.Println("Error Making UUID:", err.Error())
		return
	}

	accessToken, refreshToken, err := h.jwtHandler.GenerateAuthJWT()
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("failed to generate token", err.Error())
		return
	}

	hashPassword, err := hashing.HashPassword(redisUser.Password)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: "Error while hashing password",
		})
		log.Println("Error while hashing password:", err.Error())
		return
	}

	user, err := h.storage.User().Create(ctxTime, &repo.User{
		Id:           id.String(),
		Name:         redisUser.Name,
		Username:     redisUser.Username,
		Email:        redisUser.Email,
		Password:     hashPassword,
		RefreshToken: refreshToken,
	})
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.NotFoundMessage,
		})
		log.Println("failed to get resUser in getinfo api", err.Error())
		return
	}

	ctx.JSON(http.StatusOK, models.VerifyResponse{
		Id:        user.Id,
		Name:      user.Name,
		Username:  user.Username,
		Email:     user.Email,
		Access:    accessToken,
		Refresh:   refreshToken,
		CreatedAt: user.CreatedAt,
	})
}

// // @Summary 	  Forgot Password
// // @Description   This Api for set new password as forgot password
// // @Tags 		  Register
// // @Accept 		  json
// // @Produce 	  json
// // @Param         login path string true "Login"
// // @Success 	  200 {object} models.Forgot
// // @Failure 	  500 {object} models.Error
// // @Router 		  /v1/forgot/{login} [GET]
// func (h *handlerV1) ForgotPassword(ctx *gin.Context) {
// 	login := ctx.Param("login")

// 	duration, err := time.ParseDuration(h.cfg.CtxTimeout)
// 	if err != nil {
// 		ctx.JSON(http.StatusInternalServerError, models.Error{
// 			Message: models.InternalMessage,
// 		})
// 		log.Println("failed to parse timeout", err.Error())
// 		return
// 	}

// 	ctxTime, cancel := context.WithTimeout(context.Background(), duration)
// 	defer cancel()

// 	id, role, err := h.storage.Login().GetUserByLogin(ctxTime, login)
// 	if err != nil {
// 		ctx.JSON(http.StatusBadRequest, models.Error{
// 			Message: models.WrongLoginOrPassword,
// 		})
// 		log.Println("failed to finding user info by login", err.Error())
// 		return
// 	}

// 	var response models.Forgot
// 	if role == "student" {
// 		student, err := h.storage.User().Get(ctxTime, id)
// 		if err != nil {
// 			ctx.JSON(http.StatusInternalServerError, models.Error{
// 				Message: models.WrongInfoMessage,
// 			})
// 			log.Println("failed to get teacher by login", err.Error())
// 			return
// 		}
// 		response.Email = student.Email
// 		response.FirstName = student.FirstName
// 		response.LastName = student.LastName
// 	} else if role == "admin" {
// 		response.Email = "admin_email"
// 		response.FirstName = "Admin First Name"
// 		response.LastName = "Admin Last Name"
// 	}

// 	otp := email.GenerateCode(6)
// 	if err := memory.Set(otp, &response); err != nil {
// 		ctx.JSON(http.StatusInternalServerError, models.Error{
// 			Message: models.InternalMessage,
// 		})
// 		log.Println("failed to set code to redisdb", err.Error())
// 		return
// 	}

// 	Data := models.EmailData{
// 		Code: cast.ToString(otp),
// 	}

// 	err = email.SendEmail([]string{response.Email}, "gor Biolog UZ\n", *h.cfg, "./api/helper/email/forgot_password.html", Data)
// 	if err != nil {
// 		ctx.JSON(http.StatusInternalServerError, models.Error{
// 			Message: models.InternalMessage,
// 		})
// 		log.Println("failed to sending email", err.Error())
// 		return
// 	}

// 	ctx.JSON(http.StatusOK, response)
// }

/*
// @Summary 	  Update Password
// @Description   This Api for login users
// @Tags 		  Register
// @Accept 		  json
// @Produce 	  json
// @Param         login query string true "Login"
// @Param         password query string true "Password"
// @Param 		  confirm query string true "Confirm Password"
// @Success 	  200 {object} bool
// @Failure 	  400 {object} models.Error
// @Failure 	  500 {object} models.Error
// @Router 		  /v1/update-password [PUT]
func (h *handlerV1) UpdatePassword(ctx *gin.Context) {
	login := ctx.Query("login")
	password := ctx.Query("password")
	confirm := ctx.Query("confirm")

	if len(password) < 8 || len(confirm) < 8 || len(password) > 30 || len(confirm) > 30 {
		ctx.JSON(http.StatusBadRequest, models.Error{
			Message: models.WeakPassword,
		})
		log.Println(models.WeakPassword, login)
		return
	}

	if confirm != password {
		ctx.JSON(http.StatusBadRequest, models.Error{
			Message: models.NotEqualConfirm,
		})
		log.Println("Not equal password with confirm")
		return
	}

	hashPassowrd, err := hashing.HashPassword(password)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("failed to hashing password", err.Error())
		return
	}

	duration, err := time.ParseDuration(h.cfg.CtxTimeout)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("failed to parse timeout", err.Error())
		return
	}

	ctxTime, cancel := context.WithTimeout(context.Background(), duration)
	defer cancel()

	_, err = h.storage.Login().UpdatePassword(
		ctxTime,
		&repo.LoginPassword{
			Login:    login,
			Password: hashPassowrd,
		})
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.NotUpdatedMessage,
		})
		log.Println("failed to hashing password", err.Error())
		return
	}

	ctx.JSON(http.StatusOK, true)
}

// @Summary 		Token
// @Description 	This API generate a new access token with login and role
// @Tags 			Register
// @Accept 			json
// @Produce 		json
// @Param 			refresh path string true "Refresh Token"
// @Success 		200 {object} models.Login
// @Failure 		400 {object} models.Error
// @Failure 		401 {object} models.Error
// @Failure 		403 {object} models.Error
// @Failure 		500 {object} models.Error
// @Router 			/v1/token/{refresh} [GET]
func (h *handlerV1) Token(ctx *gin.Context) {
	token := ctx.Param("refresh")

	claims, err := tokens.ExtractClaim(token, []byte(h.cfg.SigningKey))
	if err != nil {
		ctx.JSON(http.StatusUnauthorized, models.Error{
			Message: models.TokenInvalid,
		})
		log.Println("failed to extract cleams from refresh token", err.Error())
		return
	}

	login, ok := claims["sub"].(string)
	if !ok {
		ctx.JSON(http.StatusBadRequest, models.Error{
			Message: models.TokenInvalid,
		})
		log.Println("failed to get sub in token claims")
		return
	}

	duration, err := time.ParseDuration(h.cfg.CtxTimeout)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("failed to parse timeout", err.Error())
		return
	}

	ctxTime, cancel := context.WithTimeout(context.Background(), duration)
	defer cancel()

	ID, role, err := h.storage.Login().GetUserByLogin(ctxTime, login)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("failed to get user by id [token]", err.Error())
		return
	}

	h.jwtHandler = tokens.JWTHandler{
		Sub:       login,
		Iat:       cast.ToString(time.Now().Unix()),
		Role:      role,
		SigninKey: h.cfg.SigningKey,
		Timeout:   cast.ToInt(h.cfg.AccessTokenTimeout),
	}

	accessToken, _, err := h.jwtHandler.GenerateAuthJWT()
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("failed to generate token", err.Error())
		return
	}

	ctx.JSON(http.StatusOK, models.Login{
		UserId:  ID,
		Role:    role,
		Access:  accessToken,
		Refresh: token,
	})
}

// @Security 		BearerAuth
// @Summary 		Get User Info
// @Description 	This API for gets user info with login
// @Tags 			Register
// @Accept			json
// @Produce 		json
// @Param 			login path uint64 true "Login"
// @Success 		200 {object} models.UserInfo
// @Failure 		400 {object} models.Error
// @Failure 		401 {object} models.Error
// @Failure 		403 {object} models.Error
// @Failure  		500 {object} models.Error
// @Router 			/v1/users/{login} [GET]
func (h *handlerV1) GetInfo(ctx *gin.Context) {
	login := ctx.Param("login")

	intLogin, err := strconv.Atoi(login)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.NotFoundMessage,
		})
		log.Println("failed to parse int login in get getinfo", err.Error())
		return
	}

	duration, err := time.ParseDuration(h.cfg.CtxTimeout)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("failed to parse timeout", err.Error())
		return
	}

	ctxTime, cancel := context.WithTimeout(context.Background(), duration)
	defer cancel()

	ID, role, err := h.storage.Login().GetUserByLogin(ctxTime, login)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.NotFoundMessage,
		})
		log.Println("failed to get user by login", err.Error())
		return
	}

	var response models.UserInfo
	switch role {
	case "admin":
		response.ID = ID
		response.Login = uint64(intLogin)
		response.Role = "admin"
		response.FirstName = "Admin First Name"
		response.LastName = "Admin Last Name"
	case "student":
		student, err := h.storage.Student().Get(ctxTime, ID)
		if err != nil {
			ctx.JSON(http.StatusInternalServerError, models.Error{
				Message: models.NotFoundMessage,
			})
			log.Println("failed to get student in getinfo api", err.Error())
			return
		}
		response.ID = ID
		response.Login = uint64(intLogin)
		response.Role = "student"
		response.FirstName = student.FirstName
		response.LastName = student.LastName
	default:
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.NotFoundMessage,
		})
		log.Println("incorrect role")
		return
	}

	ctx.JSON(http.StatusOK, response)
}
*/
