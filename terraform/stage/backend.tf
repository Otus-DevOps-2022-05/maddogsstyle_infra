terraform {
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "maddogsstyle"
    region                      = "ru-central1"
    key                         = "states/stage.tfstate"
    access_key                  = "YCAJE2aMGdbL_xDxLD6tODzem"
    secret_key                  = "YCPjaeA0D4MubChHu8Vo6j6SSdCe-A9I80i4niWG"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
