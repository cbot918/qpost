package main

import (
	"app/internal/userService"
	"app/internal/userService/userController"
	"app/internal/userService/userRepository"
	"app/internal/userService/userUseCase"
	"app/pkg/config"
	h "app/pkg/helper"
	"log"

	"github.com/gin-gonic/gin"
)

func main() {

	var err error

	cfg, err := config.NewConfig()
	if err != nil {
		log.Fatal("err reading config: ", err)
	}
	h.PrintJSON(cfg)

	database, err := h.ConnectPostgres(cfg)
	if err != nil {
		log.Fatal("err connecting postgres: ", err)
	}

	userRepo := userRepository.NewUserRepositoryImpl(database)
	userUseCase := userUseCase.NewUserUseCaseImpl(userRepo)
	userController := userController.NewUserController(userUseCase)

	router := gin.Default()
	userService := userService.NewUserService()

	router = userService.SetupRouter(router, userController)

	if err := router.Run(cfg.HOST); err != nil {
		log.Fatal("server run error: ", err)
		return
	}

	// dsn := "postgresql://yale:12345@localhost:5432/testdb?sslmode=disable"

}
