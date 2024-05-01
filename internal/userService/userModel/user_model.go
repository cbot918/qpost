package userModel

import "time"

type User struct {
	Id        string    `gorm:"column:id"`
	Username  string    `gorm:"column:username"`
	Email     string    `gorm:"column:email;unique"`
	Password  string    `gorm:"column:password"`
	CreatedAt time.Time `gorm:"column:created_at"`
}
