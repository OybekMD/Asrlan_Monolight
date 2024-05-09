package v1

import (
	"asrlan-monolight/api/helper/parsing"
	"context"
	"log"
	"net/http"
	"time"

	"asrlan-monolight/api/models"
	"asrlan-monolight/storage/repo"

	"github.com/gin-gonic/gin"
)

// @Security      BearerAuth
// @Summary 	  Create Social
// @Description   This Api for creating a new social
// @Tags 		  social
// @Accept 		  json
// @Produce 	  json
// @Param 		  SocialCreate body models.SocialCreate true "SocialCreate Model"
// @Success 	  201 {object} models.SocialResponse
// @Failure 	  400 {object} models.Error
// @Failure 	  401 {object} models.Error
// @Failure 	  403 {object} models.Error
// @Failure 	  500 {object} models.Error
// @Router 		  /v1/social [POST]
func (h *handlerV1) CreateSocial(ctx *gin.Context) {
	var body models.SocialCreate

	err := ctx.ShouldBindJSON(&body)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, &models.Error{
			Message: models.WrongInfoMessage,
		})
		log.Println("failed to bind json", err.Error())
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

	response, err := h.storage.Social().Create(
		ctxTime,
		&repo.Social{
			LocationName:  body.LocationName,
			LocationUrl:   body.LocationUrl,
			EducationName: body.EducationName,
			EducationUrl:  body.EducationUrl,
			TelegramName:  body.TelegramName,
			TelegramUrl:   body.TelegramUrl,
			TwitterName:   body.TwitterName,
			TwitterUrl:    body.TwitterUrl,
			InstagramName: body.InstagramName,
			InstagramUrl:  body.InstagramUrl,
			YoutubeName:   body.YoutubeName,
			YoutubeUrl:    body.YoutubeUrl,
			LinkedinName:  body.LinkedinName,
			LinkedinUrl:   body.LinkedinUrl,
			WebsiteName:   body.WebsiteName,
			WebsiteUrl:    body.WebsiteUrl,
			UserId:        body.UserId,
		})
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, &models.Error{
			Message: models.NotCreatedMessage,
		})
		log.Println("failed to create user", err.Error())
		return
	}

	ctx.JSON(http.StatusCreated, &models.SocialResponse{
		LocationName:  response.LocationName,
		LocationUrl:   response.LocationUrl,
		EducationName: response.EducationName,
		EducationUrl:  response.EducationUrl,
		TelegramName:  response.TelegramName,
		TelegramUrl:   response.TelegramUrl,
		TwitterName:   response.TwitterName,
		TwitterUrl:    response.TwitterUrl,
		InstagramName: response.InstagramName,
		InstagramUrl:  response.InstagramUrl,
		YoutubeName:   response.YoutubeName,
		YoutubeUrl:    response.YoutubeUrl,
		LinkedinName:  response.LinkedinName,
		LinkedinUrl:   response.LinkedinUrl,
		WebsiteName:   response.WebsiteName,
		WebsiteUrl:    response.WebsiteUrl,
		UserId:        response.UserId,
	})
}

// @Security      BearerAuth
// @Summary 	  Update Social
// @Description   This Api for updating social
// @Tags 		  social
// @Accept 		  json
// @Produce 	  json
// @Param 		  Social body models.SocialUpdate true "Update Social Model"
// @Success 	  200 {object} models.SocialResponse
// @Failure 	  400 {object} models.Error
// @Failure 	  401 {object} models.Error
// @Failure 	  403 {object} models.Error
// @Failure 	  500 {object} models.Error
// @Router 		  /v1/social [PUT]
func (h *handlerV1) UpdateSocial(ctx *gin.Context) {
	var body models.SocialUpdate

	err := ctx.ShouldBindJSON(&body)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, &models.Error{
			Message: models.WrongInfoMessage,
		})
		log.Println("failed to bind json", err.Error())
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

	socialModel := &repo.Social{}
	err = parsing.StructToStruct(&body, socialModel)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.InternalMessage,
		})
		log.Println("Error parsing struct to struct", err.Error())
		return
	}

	response, err := h.storage.Social().Update(ctxTime, socialModel)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, &models.Error{
			Message: models.NotUpdatedMessage,
		})
		log.Println("failed to update user", err.Error())
		return
	}

	ctx.JSON(http.StatusOK, response)
}

// @Security      BearerAuth
// @Summary 	  Get Social
// @Description   This Api for get social
// @Tags 		  social
// @Accept        json
// @Produce       json
// @Param         id path string true "ID"
// @Success 	  200 {object} models.SocialResponse
// @Failure		  401 {object} models.Error
// @Failure		  403 {object} models.Error
// @Failure       500 {object} models.Error
// @Router        /v1/social/{id} [GET]
func (h *handlerV1) GetSocial(ctx *gin.Context) {
	id := ctx.Param("id")

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

	social, err := h.storage.Social().Get(ctxTime, id)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, models.Error{
			Message: models.NotFoundMessage,
		})
		log.Println("failed to get social", err.Error())
		return
	}

	ctx.JSON(http.StatusOK, social)
}