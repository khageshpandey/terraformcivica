# icasework-beanstalk

This repository contains all of the configuration for the iCasework Beanstalk environments. It is intended as a stop-gap solution to quickly spin up Beanstalk environments to replace existing environments which are now out of support.

<!-- toc -->

* [Adding environments](#adding-environments)
* [Requirements](#requirements)
* [Providers](#providers)
* [Modules](#modules)
* [Resources](#resources)
* [Inputs](#inputs)
* [Outputs](#outputs)
* [Contributing](#contributing)
  * [Commit style](#commit-style)
  * [Pre Commit](#pre-commit)

<!-- Regenerate with "pre-commit run -a markdown-toc" -->

<!-- tocstop -->

## Adding environments

1. Use your preferred IDE to clone the repository.

2. Ensure that you have installed the [pre-commit](#pre-commit) configuration before making any changes as this will ensure the files have been formatted and validated before pushing to Github. Note, this only needs to be done once after cloning the repository.

3. In your IDE, create a new branch e.g. `chore/add-prod-environment-ausadminapp0`. If using VS Code, ensuring you have the `Hashicorp Terraform` extension installed, you can follow the steps [here](https://medium.com/nerd-for-tech/how-to-auto-format-hcl-terraform-code-in-visual-studio-code-6fa0e7afbb5e#:~:text=%F0%9F%93%9DOpen%20Visual%20Studio%20Code,HashiCorp%20Terraform%20once%20it%20appears.&text=%F0%9F%93%9DIn%20the%20search%20settings%20type%20%E2%80%9Cformat%E2%80%9D.&text=Confirm%20the%20auto%20format%20works.) to ensure it is installed and configured to automatically format files on save.

4. There are two variable files, one for dev (`tfvars/dev.tfvars`) and one for prod (`tfvars/prod.tfvars`). Add a new block under the `beanstalk_environments` section, including all of the configuration options for your environment:

```
beanstalk_environments = {
  myenvironmentname = {
    region                   = "eu-central-1" # OPTIONAL - Default: eu-central-1
    solution_stack_name      = "64bit Amazon Linux 2023 v5.3.2 running Tomcat 10 Corretto 21" # OPTIONAL
    application_name         = "UAT iCasework"
    tier                     = "WebServer" # OPTIONAL - Default: WebServer
    version_label            = "icasework-v10.0rc36"
    keypair                  = "uat-al2023-key"
    ec2_instance_type        = "m5.large" # OPTIONAL - Default: m5.large
    vpc_id                   = "vpc-05a36b7d8fa2fb968"
    application_subnets      = ["subnet-0bc29e5bc66f85834", "subnet-098e277f938adf5ec"]
    loadbalancer_subnets     = ["subnet-003e492332b52ba8f", "subnet-00d3f2574455fe4e9"]
    asg_securitygroups       = ["sg-08e149d944648bc84"]
    asg_min                  = 1 # OPTIONAL - Default: 1
    asg_max                  = 1 # OPTIONAL - Default: 2
    ssl_certificate_id       = "arn:aws:acm:eu-central-1:555124824930:certificate/fd20e47d-47ff-402b-8bb7-b73369aa603f"
    platform_updates_enabled = true # OPTIONAL - Default: false
    instance_logs_enabled    = true # OPTIONAL - Default: false
  }
}

```

5. Once the variables file has been updated, stage and commit the changes, you can use a commit message like:

```
chore: adding new production environment for ausadminapp0
```

6. Publish/push the new branch to Github.

7. Create a Pull Request (PR) detailing the work you have done and request a team member to review.

8. Once reviewed and merged, the [main.yaml](.github/workflows/main.yaml) workflow will automatically run to validate, plan and deploy the changes. Note, `prod` requires manual approval to deploy.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.8.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_beanstalk_ap_southeast_2"></a> [beanstalk\_ap\_southeast\_2](#module\_beanstalk\_ap\_southeast\_2) | ./module-v2.0 | n/a |
| <a name="module_beanstalk_eu_central_1"></a> [beanstalk\_eu\_central\_1](#module\_beanstalk\_eu\_central\_1) | ./module-v3.0 | n/a |
| <a name="module_beanstalk_eu_west_1"></a> [beanstalk\_eu\_west\_1](#module\_beanstalk\_eu\_west\_1) | ./module-v2.0 | n/a |
| <a name="module_beanstalk_eu_west_2"></a> [beanstalk\_eu\_west\_2](#module\_beanstalk\_eu\_west\_2) | ./module-v2.0 | n/a |
| <a name="module_beanstalk_us_east_1"></a> [beanstalk\_us\_east\_1](#module\_beanstalk\_us\_east\_1) | ./module-v2.0 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_beanstalk_environments"></a> [beanstalk\_environments](#input\_beanstalk\_environments) | Map of environments and their configs. | <pre>map(object({<br>    solution_stack_name      = optional(string, "64bit Amazon Linux 2023 v5.3.2 running Tomcat 10 Corretto 21")<br>    application_name         = string<br>    version_label            = string<br>    region                   = optional(string, "eu-central-1")<br>    tier                     = optional(string, "WebServer")<br>    ec2_instance_type        = optional(string, "m5.large")<br>    ec2_enable_spot          = optional(bool, false)<br>    keypair                  = string<br>    vpc_id                   = string<br>    application_subnets      = list(string)<br>    loadbalancer_subnets     = list(string)<br>    asg_min                  = optional(number, 1)<br>    asg_max                  = optional(number, 2)<br>    asg_securitygroups       = list(string)<br>    ssl_certificate_id       = string<br>    platform_updates_enabled = optional(bool, false)<br>    instance_logs_enabled    = optional(bool, false)<br>    deployment_policy        = optional(string, "Immutable")<br>    jvm_options              = optional(string, "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600")<br>    eb_settings = optional(list(object({<br>      namespace = string<br>      name      = string<br>      value     = string<br>    })), [])<br>  }))</pre> | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment type. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Contributing

### Commit style

All commits should be done using the [Conventional Commit](https://www.conventionalcommits.org)
standard.

```git
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

For example: `feat: adding some awesome feature` or `chore: removing redundant config`

### Pre Commit

Make sure to [install](https://pre-commit.com/) and set the pre-commit hooks before contributing to this repo. Once installed, run the following from your local repository path:

```sh
pre-commit install
```
