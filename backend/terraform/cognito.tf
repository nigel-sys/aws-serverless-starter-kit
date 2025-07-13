resource "aws_cognito_user_pool" "user_pool" {
  name = "${var.project_name}-user-pool"
  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = false
    require_uppercase = false
  }
}

resource "aws_cognito_user_pool_client" "client" {
  name         = "${var.project_name}-client"
  user_pool_id = aws_cognito_user_pool.user_pool.id
  generate_secret = false

  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows = ["implicit"]
  allowed_oauth_scopes = ["email", "openid", "profile"]

  callback_urls = [
    "https://${aws_cloudfront_distribution.frontend_cdn.domain_name}/callback.html"
  ]

  logout_urls = [
    "https://${aws_cloudfront_distribution.frontend_cdn.domain_name}/index.html"
  ]

  supported_identity_providers = ["COGNITO"]
}


resource "aws_cognito_user_pool_domain" "domain" {
  domain       = "${var.project_name}-auth-domain-${random_id.rand.hex}"
  user_pool_id = aws_cognito_user_pool.user_pool.id
}

resource "random_id" "rand" {
  byte_length = 4
}


output "user_pool_id" {
  value = aws_cognito_user_pool.user_pool.id
}

output "client_id" {
  value = aws_cognito_user_pool_client.client.id
}

output "hosted_ui_url" {
  value = "https://${aws_cognito_user_pool_domain.domain.domain}.auth.${var.aws_region}.amazoncognito.com/login?client_id=${aws_cognito_user_pool_client.client.id}&response_type=token&scope=email+openid+profile&redirect_uri=https://${aws_cloudfront_distribution.frontend_cdn.domain_name}/callback.html"
}

