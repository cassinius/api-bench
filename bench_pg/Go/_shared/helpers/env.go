package helpers

import "os"

func GetLogLevel() string {
	if os.Getenv("APP_ENV") == "production" {
		return "error"
	} else {
		return "info"
	}
}
