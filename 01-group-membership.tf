#create a group membership template that you can link .tfvars to

resource "aws_iam_group_membership" "sargeants" {
  for_each = var.aws_iam_group_memberships
  name = "${each.key}-group"
  group = aws_iam_group.groups[each.key].name
  users = each.value
} 

resource "aws_iam_group" "groups"{
  for_each = var.aws_iam_group_memberships
  name = "${each.key}"
}

resource "aws_iam_user" "users"{
  for_each = toset(var.aws_iam_users) #toset is converts the list into a set type [] -> {}
  name = each.value
}