data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  availability_zones = [
    for zone in data.aws_availability_zones.available.names : zone if zone == "ap-southeast-2a"
  ]
}