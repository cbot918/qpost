package internal

import "github.com/gin-gonic/gin"

type Server struct{}

func NewServer() *Server {
	return &Server{}
}

func (s *Server) SetupRouter(router *gin.Engine) {

}
