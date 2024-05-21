package v1

import (
	"context"
	"log"
	"net/http"
	"time"

	"asrlan-monolight/api/models"

	"github.com/gin-gonic/gin"
)

// @Security      BearerAuth
// @Summary       ListProfiles
// @Description   This Api for get all profiles
// @Tags          profiles
// @Accept        json
// @Produce       json
// @Param         id query string true "Level Id"
// @Param         period query string true "Period 1,2,3"
// @Failure		  400 {object} models.Error
// @Failure		  401 {object} models.Error
// @Failure		  403 {object} models.Error
// @Failure       500 {object} models.Error
// @Router        /v1/profile [GET]
func (h *handlerV1) Profile(ctx *gin.Context) {
	user_id := ctx.Query("id")
	// period := ctx.Query("period")

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

	profiles, err := h.storage.Profile().GetUser(ctxTime, user_id)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, &models.Error{
			Message: models.NotFoundMessage,
		})
		log.Println("failed to get all users", err.Error())
		return
	}
	// if len(profiles) == 0 {
	// 	ctx.JSON(http.StatusOK, nil)
	// 	log.Println("Not found profiles")
	// 	return
	// }

	ctx.JSON(http.StatusOK, profiles)
	// ctx.JSON(http.StatusOK, models.ProfileListResponse{
	// 	Profiles: profiles,
	// })
}
