env = "production"

beanstalk_environments = {
  # Sydney  live environments
  ausadmin-al23-0 = {
    region                   = "ap-southeast-2"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.4.3 running Tomcat 10 Corretto 21"
    application_name         = "Live iCasework Australia"
    version_label            = "icasework-v10.2.1-85c0ffb"
    keypair                  = "prodausal23"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-0e906165e23df7981"
    application_subnets      = ["subnet-0d3d7f014c9073f53", "subnet-08a63242f0990efc9", "subnet-07644f969f86e995d"]
    loadbalancer_subnets     = ["subnet-0b34d0119fcc52495", "subnet-0716f71c039b9e8a0", "subnet-09cdd50e3c2f74523"]
    asg_securitygroups       = [""]
    ssl_certificate_id       = "arn:aws:acm:ap-southeast-2:550248470219:certificate/6be279ea-0e1d-466c-93a3-4792c55a637b"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 2
    asg_max                  = 4
    deployment_policy        = "Immutable"
    eb_settings              = []
  },
  ausportal-al23-0 = {
    region                   = "ap-southeast-2"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.4.3 running Tomcat 10 Corretto 21"
    application_name         = "Live iCasework Australia"
    version_label            = "icasework-v10.2.1-85c0ffb"
    keypair                  = "prodausal23"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-0e906165e23df7981"
    application_subnets      = ["subnet-0d3d7f014c9073f53", "subnet-08a63242f0990efc9", "subnet-07644f969f86e995d"]
    loadbalancer_subnets     = ["subnet-0b34d0119fcc52495", "subnet-0716f71c039b9e8a0", "subnet-09cdd50e3c2f74523"]
    asg_securitygroups       = [""]
    ssl_certificate_id       = "arn:aws:acm:ap-southeast-2:550248470219:certificate/6be279ea-0e1d-466c-93a3-4792c55a637b"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 2
    asg_max                  = 4
    deployment_policy        = "Immutable"
    eb_settings              = []
  },
  # Sydney train environment
  trainausadmin-al23-0 = {
    region                   = "ap-southeast-2"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.4.3 running Tomcat 10 Corretto 21"
    application_name         = "UAT iCasework Australia"
    version_label            = "icasework-v10.2.1-85c0ffb"
    keypair                  = "uatausal23"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-0070be9d34e05a5a0"
    application_subnets      = ["subnet-0a111ae05900f43ee", "subnet-079d2e6ca6ad284af", "subnet-01b9049666b6e85dd"]
    loadbalancer_subnets     = ["subnet-02e642f853d87d9c6", "subnet-0e21b68e18e77597e", "subnet-07770485f5a2bffe5"]
    asg_securitygroups       = [""]
    ssl_certificate_id       = "arn:aws:acm:ap-southeast-2:550248470219:certificate/6be279ea-0e1d-466c-93a3-4792c55a637b"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 1
    asg_max                  = 2
    deployment_policy        = "Immutable"
    eb_settings              = []
  }
}
