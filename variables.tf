variable "tags" {
  type        = map(any)
  description = "Please provide a list of tags"
  default = {
    Dept    = "IT"
    Team    = "Devops"
    Quarter = "1"
  }
}