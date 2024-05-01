package helper

import (
	"fmt"
	"log"

	"app/pkg/config"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func ConnectPostgres(config *config.Config) (*gorm.DB, error) {
	db, err := gorm.Open(postgres.Open(config.DB_HOST), &gorm.Config{})
	if err != nil {
		log.Fatal("db open failed")
	}
	fmt.Println("postgres connect success")
	return db, nil
}
