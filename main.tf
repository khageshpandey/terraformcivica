module "beanstalk_eu_central_1" {
  for_each = {
    for name, environment in var.beanstalk_environments : name => environment
    if environment.region == "eu-central-1"
  }
  providers = {
    aws = aws
  }
  source = "./module-v3.0"

  environment              = each.key
  application_name         = each.value.application_name
  keypair                  = each.value.keypair
  ec2_instance_type        = each.value.ec2_instance_type
  vpc_id                   = each.value.vpc_id
  application_subnets      = each.value.application_subnets
  loadbalancer_subnets     = each.value.loadbalancer_subnets
  asg_securitygroups       = each.value.asg_securitygroups
  ssl_certificate_id       = each.value.ssl_certificate_id
  tier                     = each.value.tier
  solution_stack_name      = each.value.solution_stack_name
  version_label            = each.value.version_label
  ec2_enable_spot          = each.value.ec2_enable_spot
  asg_min                  = each.value.asg_min
  asg_max                  = each.value.asg_max
  platform_updates_enabled = each.value.platform_updates_enabled
  instance_logs_enabled    = each.value.instance_logs_enabled
  deployment_policy        = each.value.deployment_policy
  jvm_options              = each.value.jvm_options
  eb_settings              = each.value.eb_settings
}

module "beanstalk_ap_southeast_2" {
  for_each = {
    for name, environment in var.beanstalk_environments : name => environment
    if environment.region == "ap-southeast-2"
  }
  providers = {
    aws = aws.ap-southeast-2
  }
  source = "./module-v2.0"

  environment              = each.key
  application_name         = each.value.application_name
  keypair                  = each.value.keypair
  ec2_instance_type        = each.value.ec2_instance_type
  vpc_id                   = each.value.vpc_id
  application_subnets      = each.value.application_subnets
  loadbalancer_subnets     = each.value.loadbalancer_subnets
  asg_securitygroups       = each.value.asg_securitygroups
  ssl_certificate_id       = each.value.ssl_certificate_id
  tier                     = each.value.tier
  solution_stack_name      = each.value.solution_stack_name
  version_label            = each.value.version_label
  ec2_enable_spot          = each.value.ec2_enable_spot
  asg_min                  = each.value.asg_min
  asg_max                  = each.value.asg_max
  platform_updates_enabled = each.value.platform_updates_enabled
  instance_logs_enabled    = each.value.instance_logs_enabled
  deployment_policy        = each.value.deployment_policy
  eb_settings              = each.value.eb_settings
}

module "beanstalk_eu_west_1" {
  for_each = {
    for name, environment in var.beanstalk_environments : name => environment
    if environment.region == "eu-west-1"
  }
  providers = {
    aws = aws.eu-west-1
  }
  source = "./module-v2.0"

  environment              = each.key
  application_name         = each.value.application_name
  loadbalancer_subnets     = each.value.loadbalancer_subnets
  keypair                  = each.value.keypair
  ec2_instance_type        = each.value.ec2_instance_type
  vpc_id                   = each.value.vpc_id
  application_subnets      = each.value.application_subnets
  asg_securitygroups       = each.value.asg_securitygroups
  ssl_certificate_id       = each.value.ssl_certificate_id
  tier                     = each.value.tier
  solution_stack_name      = each.value.solution_stack_name
  version_label            = each.value.version_label
  ec2_enable_spot          = each.value.ec2_enable_spot
  asg_min                  = each.value.asg_min
  asg_max                  = each.value.asg_max
  platform_updates_enabled = each.value.platform_updates_enabled
  instance_logs_enabled    = each.value.instance_logs_enabled
  deployment_policy        = each.value.deployment_policy
  jvm_options              = each.value.jvm_options
  eb_settings              = each.value.eb_settings
}

module "beanstalk_eu_west_2" {
  for_each = {
    for name, environment in var.beanstalk_environments : name => environment
    if environment.region == "eu-west-2"
  }
  providers = {
    aws = aws.eu-west-2
  }
  source = "./module-v2.0"

  environment              = each.key
  application_name         = each.value.application_name
  keypair                  = each.value.keypair
  ec2_instance_type        = each.value.ec2_instance_type
  vpc_id                   = each.value.vpc_id
  application_subnets      = each.value.application_subnets
  loadbalancer_subnets     = each.value.loadbalancer_subnets
  asg_securitygroups       = each.value.asg_securitygroups
  ssl_certificate_id       = each.value.ssl_certificate_id
  tier                     = each.value.tier
  solution_stack_name      = each.value.solution_stack_name
  version_label            = each.value.version_label
  ec2_enable_spot          = each.value.ec2_enable_spot
  asg_min                  = each.value.asg_min
  asg_max                  = each.value.asg_max
  platform_updates_enabled = each.value.platform_updates_enabled
  instance_logs_enabled    = each.value.instance_logs_enabled
  deployment_policy        = each.value.deployment_policy
  jvm_options              = each.value.jvm_options
  eb_settings              = each.value.eb_settings
}

module "beanstalk_us_east_1" {
  for_each = {
    for name, environment in var.beanstalk_environments : name => environment
    if environment.region == "us-east-1"
  }
  providers = {
    aws = aws.us-east-1
  }
  source = "./module-v2.0"

  environment              = each.key
  application_name         = each.value.application_name
  keypair                  = each.value.keypair
  ec2_instance_type        = each.value.ec2_instance_type
  vpc_id                   = each.value.vpc_id
  application_subnets      = each.value.application_subnets
  loadbalancer_subnets     = each.value.loadbalancer_subnets
  asg_securitygroups       = each.value.asg_securitygroups
  ssl_certificate_id       = each.value.ssl_certificate_id
  tier                     = each.value.tier
  solution_stack_name      = each.value.solution_stack_name
  version_label            = each.value.version_label
  ec2_enable_spot          = each.value.ec2_enable_spot
  asg_min                  = each.value.asg_min
  asg_max                  = each.value.asg_max
  platform_updates_enabled = each.value.platform_updates_enabled
  instance_logs_enabled    = each.value.instance_logs_enabled
  eb_settings              = each.value.eb_settings
}
