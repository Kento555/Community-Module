terraform {
  backend "s3" {
    bucket = "sctp-ce9-tfstate"               # This is an existing bucket to store terraform tfstate file
    key    = "ws-terraform-module-2.4.tfstate"      # Replace the value of key to <your suggested name>.tfstate 
    region = "us-east-1"
  }
}