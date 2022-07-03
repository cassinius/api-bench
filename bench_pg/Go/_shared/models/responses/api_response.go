package responses

type ApiResponse struct {
	Status  uint16 `json:"status"`
	Message string `json:"msg"`
}
