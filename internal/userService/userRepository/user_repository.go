package userRepository

import "app/internal/userService/userModel"

type UserRepository interface {
	ListUsers() ([]userModel.User, error)
}
