# AWS Serverless Starter Kit

A template for quickly deploying a simple serverless application on AWS using Terraform, Lambda, API Gateway, Cognito, S3, and CloudFront.

## What You Get

✅ A complete boilerplate for full-stack AWS app development  
✅ Auth-protected API using Cognito Hosted UI  
✅ Terraform infrastructure as code (IaC) setup  
✅ Secure HTTPS CloudFront URL  
✅ Built-in CI/CD workflow with GitHub Actions  
✅ Ready-to-deploy, customizable Lambda + frontend

---

## Why Use This?

No more piecing AWS services together. This kit gives you:

- A working **login + API call flow**
- A complete **Terraform + GitHub Actions pipeline**
- A base to build real SaaS, dashboards, MVPs, or admin portals

---

## Technologies Used

| Layer   | Tech Stack               |
| ------- | ------------------------ |
| Compute | AWS Lambda (Python 3.11) |
| API     | AWS API Gateway          |
| Auth    | AWS Cognito Hosted UI    |
| Storage | AWS S3                   |
| CDN     | AWS CloudFront (HTTPS)   |
| IaC     | Terraform                |
| CI/CD   | GitHub Actions           |

---

## Features

- **Backend:** Python AWS Lambda function, protected by Cognito authentication, exposed via API Gateway.
- **Frontend:** Static HTML/JS site hosted on S3 and served securely via CloudFront.
- **Authentication:** AWS Cognito User Pool for login/logout and securing API access.
- **Infrastructure as Code:** All resources provisioned via Terraform.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.3.0
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS account with permissions for Lambda, API Gateway, Cognito, S3, and CloudFront

## Setup

### 1. Clone the repository

```sh
git clone https://github.com/yourusername/aws-serverless-starter-kit.git
cd aws-serverless-starter-kit/aws-serverless-starter-kit
```

### 2. Configure AWS credentials

```sh
aws configure
```

### 3. Deploy infrastructure

```sh
cd backend/terraform
terraform init
terraform apply
```

- This will provision all AWS resources.
- After apply, note the outputs for `frontend_url` (CloudFront domain), `client_id`, and `hosted_ui_url`.

### 4. Update Frontend Configuration

All configuration values (like CloudFront domain and Cognito settings) are centralized in `config.js`.

#### Steps:

1. Open the file:  
   `frontend/static-site/config.js`

2. Replace the placeholders with your actual values from the Terraform outputs:

   ```js
   window.APP_CONFIG = {
     clientId: 'your-cognito-client-id',
     redirectUri: 'https://your-cloudfront-domain/callback.html',
     cognitoDomain: 'https://your-cognito-domain.auth.region.amazoncognito.com',
     apiUrl: 'https://your-api-gateway-url/prod/hello',
   };
   ```

### 5. Upload frontend to S3

```sh
aws s3 sync ../../frontend/static-site/ s3://serverless-starter-frontend/
```

### 6. Access your app

- Open the CloudFront URL from the Terraform output in your browser.
- You will be redirected to Cognito for authentication.

---

## Try It Live 🧪

Visit: https://...cloudfront.net/login.html

- Login/signup via Cognito
- Get redirected to index.html
- Click “Call Hello API”
- See "Hello from AWS Lambda!"

---

## GitHub Actions (CI/CD)

Push to main and this runs automatically:

✅ Zips and updates Lambda  
✅ Syncs frontend to S3

**Secrets needed in GitHub:**

- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AWS_REGION

---

## Want Help Customizing or Extending?

Need:

- Help deploying your own app?
- Adding a database (RDS/DynamoDB)?
- Customizing Cognito flows?
- Infrastructure optimization?

Hire me on Fiverr:  
👉 [https://www.fiverr.com/s/Ke9VjvE](https://www.fiverr.com/s/Ke9VjvE)

---

[![Buy Me a Coffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-support-yellow?style=for-the-badge&logo=buy-me-a-coffee)](https://www.buymeacoffee.com/nigieuno)

---

## License

This project is licensed for Personal Use Only.  
See LICENSE.txt for details.

---

## Credits

Built with ❤️ by Pratyush — Cloud Computing Enthusiat & AWS Developer
