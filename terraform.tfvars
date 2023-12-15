# These are my iam group memberships to enroll users
aws_iam_group_memberships = {
#group membership for the airmen
"airmen" = ["Jim", "Mike", "Slim"]

#group membership for the sargeants 
"sargeants" = ["Mark", "Tyler", "Roger"]
}
aws_iam_users = ["Jim", "Mike", "Slim","Mark", "Tyler", "Roger" ]

aws_iam_group_permissions = {
    # This is 1 of 2 Permission policies for users to utilize
    "sargeants" = {
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:DescribeInstances", 
         "ec2:DescribeImages",
         "ec2:DescribeTags", 
         "ec2:DescribeSnapshots"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  },

    # This is 2 of 2 Permission policies for users to utilize
    "airmen" = {
    Version = "2012-10-17"
    Statement = [
      {
            "Effect": "Allow",
            "Action": [
                "ecr:*",
                "cloudtrail:LookupEvents"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "iam:CreateServiceLinkedRole"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": [
                        "replication.ecr.amazonaws.com"
                    ]
                }
            }
        }
    ]
  }
}