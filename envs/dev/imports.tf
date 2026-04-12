# ─── Terraform Import Blocks ─────────────────────────────────────────────────
#
# These blocks tell Terraform to adopt existing AWS resources into state
# instead of trying to create them from scratch.
#
# Context: ECR repositories already existed in AWS when the Terraform state
# was deleted. Running apply without these blocks causes RepositoryAlreadyExistsException.
#
# How it works:
#   - On the next `terraform plan/apply` Terraform reads the existing resource
#     from AWS and writes it into state — no recreation, no downtime.
#   - These blocks are safe to leave permanently (idempotent after first import).
#   - You can remove them after the first successful apply if you prefer a clean file.
#
# ─────────────────────────────────────────────────────────────────────────────

import {
  to = module.ecr.aws_ecr_repository.main["api-gateway"]
  id = "api-gateway"
}

import {
  to = module.ecr.aws_ecr_repository.main["auth-service"]
  id = "auth-service"
}

import {
  to = module.ecr.aws_ecr_repository.main["pharma-ui"]
  id = "pharma-ui"
}

import {
  to = module.ecr.aws_ecr_repository.main["notification-service"]
  id = "notification-service"
}

import {
  to = module.ecr.aws_ecr_repository.main["drug-catalog-service"]
  id = "drug-catalog-service"
}
