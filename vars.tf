variable "region" {
  default = "us-east-1"
}
variable "access_key" {
  default = ""
  description = "Development enviroment only"
}
variable "secret_key" {
  default = ""
  description = "Development enviroment only"
}


variable "database-name" {
  default = "database"
}
variable "database-user" {
  default = "user"
}
variable "database-password" {
  default = "password"
}