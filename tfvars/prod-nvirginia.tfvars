env = "production"

beanstalk_environments = {
  # N Virginia  environments
  usaadminapp-al23-0 = {
    region                   = "us-east-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.4.3 running Tomcat 10 Corretto 21"
    application_name         = "Live iCasework"
    version_label            = "icasework-v10.2.1-85c0ffb"
    keypair                  = "produsaal23"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-05463a4d4fb1cf10c"
    application_subnets      = ["subnet-0c61972cbb15455e9", "subnet-0e801d3f8da71f5b7", "subnet-060a0599872a10cb1"]
    loadbalancer_subnets     = ["subnet-0bd0ed3e60daa2dba", "subnet-098703d1c73891363", "subnet-0340a4a2874b685eb"]
    asg_securitygroups       = [""]
    ssl_certificate_id       = "arn:aws:acm:us-east-1:550248470219:certificate/49592e57-c525-47f6-a163-0db688ccd6ec"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 2
    asg_max                  = 4
    eb_settings              = []
  },
  usareportsapp-al23-0 = {
    region                   = "us-east-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.4.3 running Tomcat 10 Corretto 21"
    application_name         = "Live iCasework"
    version_label            = "icasework-v10.2.1-85c0ffb"
    keypair                  = "produsaal23"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-05463a4d4fb1cf10c"
    application_subnets      = ["subnet-0c61972cbb15455e9", "subnet-0e801d3f8da71f5b7", "subnet-060a0599872a10cb1"]
    loadbalancer_subnets     = ["subnet-0bd0ed3e60daa2dba", "subnet-098703d1c73891363", "subnet-0340a4a2874b685eb"]
    asg_securitygroups       = [""]
    ssl_certificate_id       = "arn:aws:acm:us-east-1:550248470219:certificate/49592e57-c525-47f6-a163-0db688ccd6ec"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 2
    asg_max                  = 4
    eb_settings              = []
  },
  usaportalapp-al23-0 = {
    region                   = "us-east-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.4.3 running Tomcat 10 Corretto 21"
    application_name         = "Live iCasework"
    version_label            = "icasework-v10.2.1-85c0ffb"
    keypair                  = "produsaal23"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-05463a4d4fb1cf10c"
    application_subnets      = ["subnet-0c61972cbb15455e9", "subnet-0e801d3f8da71f5b7", "subnet-060a0599872a10cb1"]
    loadbalancer_subnets     = ["subnet-0bd0ed3e60daa2dba", "subnet-098703d1c73891363", "subnet-0340a4a2874b685eb"]
    asg_securitygroups       = [""]
    ssl_certificate_id       = "arn:aws:acm:us-east-1:550248470219:certificate/49592e57-c525-47f6-a163-0db688ccd6ec"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 2
    asg_max                  = 4
    eb_settings              = []
  },
  usaadminses-al23-0 = {
    region                   = "us-east-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.4.3 running Tomcat 10 Corretto 21"
    application_name         = "Live iCasework"
    version_label            = "icasework-v10.2.1-85c0ffb"
    keypair                  = "produsaal23"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-05463a4d4fb1cf10c"
    application_subnets      = ["subnet-0c61972cbb15455e9", "subnet-0e801d3f8da71f5b7", "subnet-060a0599872a10cb1"]
    loadbalancer_subnets     = ["subnet-0bd0ed3e60daa2dba", "subnet-098703d1c73891363", "subnet-0340a4a2874b685eb"]
    asg_securitygroups       = [""]
    ssl_certificate_id       = "arn:aws:acm:us-east-1:550248470219:certificate/49592e57-c525-47f6-a163-0db688ccd6ec"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 2
    asg_max                  = 3
    eb_settings              = []
  }
}
