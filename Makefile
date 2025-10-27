.PHONY: tf-apply tf-lint tf-destroy tf-test tf-lint

ENVIRONMENT_NAME ?= dev
ACCOUNT_ID ?= 555124824930
REGION ?= eu-central-1

-include .makerc
export

tf-init:
	terraform init -backend-config=bucket=$(ACCOUNT_ID)-icasework-tf-state-$(REGION) -backend-config=key=civica/icasework-beanstalk/terraform.tfstate

tf-plan:
	terraform plan -var-file=tfvars/$(ENVIRONMENT_NAME).tfvars $(TF_ARGS)

tf-apply:
	terraform apply -var-file=tfvars/$(ENVIRONMENT_NAME).tfvars $(TF_ARGS)

tf-destroy:
	terraform destroy -var-file=tfvars/$(ENVIRONMENT_NAME).tfvars $(TF_ARGS)

tf-test:
	terraform test -test-directory=tests/unit -var-file=tfvars/$(ENVIRONMENT_NAME).tfvars $(TF_ARGS)

tf-lint:
	terraform fmt
	terraform validate
