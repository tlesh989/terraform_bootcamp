resource "aws_dynamodb_table" "main" {
  name         = "TerraformBootcampRandomTable-${local.env}"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "RandomID"


  attribute {
    name = "RandomID"
    type = "S"
  }

  tags = merge(local.tags, {
    name = "TerraformBootcampRandomTable-${local.env}"
  })

}
