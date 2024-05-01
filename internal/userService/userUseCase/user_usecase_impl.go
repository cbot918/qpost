package userUseCase

import (
	"app/internal/userService/userModel"
	"app/internal/userService/userRepository"
)

type UserUseCaseImpl struct {
	UserRepo userRepository.UserRepository
}

func NewUserUseCaseImpl(userRepo userRepository.UserRepository) UserUseCase {
	return &UserUseCaseImpl{
		UserRepo: userRepo,
	}
}

func (u *UserUseCaseImpl) ListUsersUseCase() ([]userModel.User, error) {

	return u.UserRepo.ListUsers()

}
