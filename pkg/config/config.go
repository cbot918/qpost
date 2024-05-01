package config

import (
	"log"
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	HOST    string
	DB_HOST string
}

func NewConfig() (*Config, error) {

	if err := godotenv.Load(); err != nil {
		log.Fatal("read config error")
		return nil, err
	}

	return &Config{
		HOST:    os.Getenv("HOST"),
		DB_HOST: os.Getenv("DB_HOST"),
	}, nil
}
