variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "ssh_key_name" {
  type = string
}