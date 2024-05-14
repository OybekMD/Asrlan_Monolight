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
// @Summary       ListDashboards
// @Description   This Api for get all Dashboard
// @Tags          Dashboard
// @Accept        json
// @Produce       json
// @Param         user_id query string true "Otp"
// @Param         language_id query string true "Email"
// @Param         level_id query string true "Email"
// @Success 	  200 {object} models.DashboardResponse
// @Failure		  400 {object} models.Error
// @Failure		  401 {object} models.Error
// @Failure		  403 {object} models.Error
// @Failure       500 {object} models.Error
// @Router        /v1/dashboardresponse [GET]
func (h *handlerV1) GetDashboard(ctx *gin.Context) {
	user_id := ctx.Query("user_id")
	language_id := ctx.Query("language_id")
	level_id := ctx.Query("level_id")

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

	activitys, err := h.storage.Dashboard().GetDashboard(ctxTime, user_id, language_id, level_id)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, &models.Error{
			Message: models.NotFoundMessage,
		})
		log.Println("failed to get all users", err.Error())
		return
	}

	ctx.JSON(http.StatusOK, activitys)
}
