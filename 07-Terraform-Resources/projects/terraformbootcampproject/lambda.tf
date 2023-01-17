data "aws_iam_policy_document" "random" {
  statement {
    actions   = ["dynamodb:*"]
    resources = [aws_dynamodb_table.main.arn]
  }
  statement {
    actions   = ["s3:*"]
    resources = [aws_s3_bucket.main.arn]
  }
  statement {
    actions   = ["logs:*"]
    resources = ["${aws_cloudwatch_log_group.random.arn}:*"]
  }
}

resource "aws_iam_role" "random" {
  name = "${local.random_lambda_name}_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "random" {
  name   = "${local.random_lambda_name}_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.random.json
}

resource "aws_iam_role_policy_attachment" "random" {
  role       = aws_iam_role.random.name
  policy_arn = aws_iam_policy.random.arn
}

resource "aws_lambda_function" "random" {
  function_name = local.random_lambda_name
  role          = aws_iam_role.random.arn
  handler       = "app.handler"
  runtime       = "python3.8"
  memory_size   = 256
  timeout       = 10
  s3_bucket     = aws_s3_bucket.main.id
  s3_key        = aws_s3_object.main.id


  environment {
    variables = {
      DYNAMO_TABLE_NAME = aws_dynamodb_table.main.id
    }
  }

  depends_on = [
    aws_cloudwatch_log_group.random
  ]

  tags = merge(local.tags, {
    name = local.random_lambda_name
  })
}

resource "aws_cloudwatch_log_group" "random" {
  name              = "/aws/lambda/${local.random_lambda_name}"
  retention_in_days = 14
}
