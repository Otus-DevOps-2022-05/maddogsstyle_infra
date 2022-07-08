terraform {
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "maddogsstyle"
    region                      = "ru-central1"
    key                         = "states/prod.tfstate"
    access_key                  = "YCAJEdF2kE2H7joxAcIuSDJ-g"
    secret_key                  = "YCP0vPA7DB0IPLedFO3HAKGqkGfNKwkx_BWo2QEg"
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}