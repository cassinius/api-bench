package responses

type ApiResponse struct {
	Status  int16  `json:"status"`
	Message string `json:"msg"`
}
