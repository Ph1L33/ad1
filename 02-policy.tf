resource "aws_iam_group_policy" "group_policies" {
  for_each = var.aws_iam_group_permissions
  name        = "${each.key}-permissions"
  group =  aws_iam_group.groups[each.key].name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(each.value)
}