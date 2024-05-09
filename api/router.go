package api

import (
	_ "asrlan-monolight/api/docs" // swag
	v1 "asrlan-monolight/api/handlers/v1"
	"asrlan-monolight/api/middleware"

	"asrlan-monolight/api/tokens"
	"asrlan-monolight/config"
	"asrlan-monolight/storage"

	"github.com/casbin/casbin/v2"
	"github.com/gin-contrib/cors"
	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"

	"github.com/gin-gonic/gin"
)

// Option ...
type Option struct {
	Conf     *config.Config
	Storage  storage.StorageI
	Enforcer *casbin.Enforcer
}

// @Title       	Admin-Monolight
// @securityDefinitions.apikey BearerAuth
// @In          	header
// @Name        	Authorization
func New(option *Option) *gin.Engine {
	gin.SetMode(option.Conf.GinMode)
	router := gin.New()

	corsConfig := cors.DefaultConfig()
	corsConfig.AllowAllOrigins = true
	corsConfig.AllowCredentials = true
	corsConfig.AllowHeaders = []string{"*"}
	corsConfig.AllowBrowserExtensions = true
	corsConfig.AllowMethods = []string{"*"}
	router.Use(cors.New(corsConfig))

	jwtHandler := tokens.JWTHandler{
		SigninKey: option.Conf.SigningKey,
	}

	handlerV1 := v1.New(&v1.HandlerV1Options{
		Cfg:        option.Conf,
		Storage:    option.Storage,
		JWTHandler: jwtHandler,
		Enforcer:   option.Enforcer,
	})

	router.Use(gin.Logger())
	router.Use(gin.Recovery())
	router.Use(middleware.NewAuthorizer(option.Enforcer, jwtHandler, *option.Conf))

	api := router.Group("/v1")

	// Login-Passwords
	api.POST("/login", handlerV1.Login)
	api.POST("/signup", handlerV1.Signup)
	api.POST("/verify", handlerV1.Verify)
	// api.GET("/forgot/:login", handlerV1.ForgotPassword)
	// api.PUT("/update-password", handlerV1.UpdatePassword)
	// api.GET("/token/:refresh", handlerV1.Token)
	// api.GET("/users/:login", handlerV1.GetInfo)

	// Fileup
	api.POST("/pdfupload", handlerV1.UploadPDFFile)
	api.POST("/imageupload", handlerV1.UploadImageFile)
	api.POST("/soundupload", handlerV1.UploadSoundFile)
	api.POST("/videoupload", handlerV1.UploadVideoFile)
	router.Static("/media", "./media")

	// Badge
	api.POST("/badge", handlerV1.CreateBadge)
	api.PUT("/badge", handlerV1.UpdateBadge)
	api.DELETE("/badge/:id", handlerV1.DeleteBadge)
	api.GET("/badge/:id", handlerV1.GetBadge)
	api.GET("/badges", handlerV1.ListBadges)

	// Students
	// api.POST("/student", handlerV1.CreateStudent)
	// api.PUT("/student", handlerV1.UpdateStudent)
	// api.DELETE("/student/:id", handlerV1.DeleteStudent)
	// api.GET("/student/:id", handlerV1.GetStudent)
	// api.GET("/students", handlerV1.ListStudents)

	// Language
	api.POST("/language", handlerV1.CreateLanguage)
	api.PUT("/language", handlerV1.UpdateLanguage)
	api.DELETE("/language/:id", handlerV1.DeleteLanguage)
	api.GET("/language/:id", handlerV1.GetLanguage)
	api.GET("/languages", handlerV1.ListLanguages)

	// Level
	api.POST("/level", handlerV1.CreateLevel)
	api.PUT("/level", handlerV1.UpdateLevel)
	api.DELETE("/level/:id", handlerV1.DeleteLevel)
	api.GET("/level/:id", handlerV1.GetLevel)
	api.GET("/levels", handlerV1.ListLevels)

	// Topic
	api.POST("/topic", handlerV1.CreateTopic)
	api.PUT("/topic", handlerV1.UpdateTopic)
	api.DELETE("/topic/:id", handlerV1.DeleteTopic)
	api.GET("/topic/:id", handlerV1.GetTopic)
	api.GET("/topics", handlerV1.ListTopics)

	// Lesson
	api.POST("/lesson", handlerV1.CreateLesson)
	api.PUT("/lesson", handlerV1.UpdateLesson)
	api.DELETE("/lesson/:id", handlerV1.DeleteLesson)
	api.GET("/lesson/:id", handlerV1.GetLesson)
	api.GET("/lessons", handlerV1.ListLessons)

	url := ginSwagger.URL("swagger/doc.json")
	api.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler, url))

	return router
}
