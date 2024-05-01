package userController

import (
	"app/internal/userService/userUseCase"
	h "app/pkg/helper"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

type UserController struct {
	UserUseCase userUseCase.UserUseCase
}

func NewUserController(userUseCase userUseCase.UserUseCase) *UserController {
	return &UserController{
		UserUseCase: userUseCase,
	}
}

func (u *UserController) ListUserController(c *gin.Context) {
	users, err := u.UserUseCase.ListUsersUseCase()
	if err != nil {
		log.Fatal(err)
		return
	}

	h.PrintJSON(users)

	c.JSON(http.StatusOK, users)
}
