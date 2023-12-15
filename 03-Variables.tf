# This is to link 4 USER placeholders to link to .tfvars file

variable "aws_iam_users" {  # var.aws_iam_users to refer back to the variable "aws_iam_users"
    #name = "user_one"
    type = list(string)
    description = "user name"
}

variable "aws_iam_group_memberships"{
    type = map(list(string))
    description = "These are my group and users to enroll"
}

variable "aws_iam_group_permissions"{
    type = any
    description = "These are my group permission policies in JSON"
}