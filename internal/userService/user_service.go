package userService

import (
	"app/internal/userService/userController"

	"github.com/gin-gonic/gin"
)

type UserService struct {
}

func NewUserService() *UserService {

	return &UserService{}
}

func (u *UserService) SetupRouter(router *gin.Engine, userController *userController.UserController) *gin.Engine {

	router.GET("/api/v1/list-users", userController.ListUserController)

	return router
}
