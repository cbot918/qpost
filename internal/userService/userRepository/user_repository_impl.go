package userRepository

import (
	"app/internal/userService/userModel"

	"gorm.io/gorm"
)

type UserRepositoryImpl struct {
	DB *gorm.DB
}

func NewUserRepositoryImpl(db *gorm.DB) UserRepository {
	return &UserRepositoryImpl{
		DB: db,
	}
}

func (u *UserRepositoryImpl) ListUsers() ([]userModel.User, error) {
	var user []userModel.User
	result := u.DB.Find(&user)
	if result.Error != nil {
		return nil, result.Error
	}

	return user, nil
}
