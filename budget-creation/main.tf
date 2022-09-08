terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_budgets_budget" "my-budget" {
  name              = "monthly-budget-30-limit"
  budget_type       = "COST"
  limit_amount      = "30"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"
  time_period_start = "2022-09-01_00:01"
}
