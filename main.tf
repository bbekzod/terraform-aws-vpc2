# Create a VPC
resource "aws_vpc" "example" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.tags
}



resource "aws_subnet" "public_subnet" {
  depends_on = [
    aws_vpc.example # Explicit dependency
  ]
  vpc_id            = aws_vpc.example.id # Implicit dependency
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = var.tags
}

resource "aws_iam_user" "lb" {
  for_each = toset(var.users)
  name     = each.value
  tags     = var.tags
}


output "list_of_users" {
  value = <<EOF

    Today you have created the following users 

     "${aws_iam_user.lb["bob"].arn}"


     EOF
}

variable "users" {
  type        = list(any)
  description = "Please supply name of the users"
  default = [
    "bob",
    "sam1",
    "lisa1",
  ]
}