package userUseCase

import "app/internal/userService/userModel"

type UserUseCase interface {
	ListUsersUseCase() ([]userModel.User, error)
}
