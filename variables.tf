variable "env" {
  description = "Environment type."
  type        = string

  validation {
    condition     = contains(["development", "production", "staging", "testing"], var.env)
    error_message = "Environment must be one of development, production, staging or testing"
  }
}

variable "beanstalk_environments" {
  description = "Map of environments and their configs."
  type = map(object({
    solution_stack_name      = optional(string, "64bit Amazon Linux 2023 v5.3.2 running Tomcat 10 Corretto 21")
    application_name         = string
    version_label            = string
    region                   = optional(string, "eu-central-1")
    tier                     = optional(string, "WebServer")
    ec2_instance_type        = optional(string, "m5.large")
    ec2_enable_spot          = optional(bool, false)
    keypair                  = string
    vpc_id                   = string
    application_subnets      = list(string)
    loadbalancer_subnets     = list(string)
    asg_min                  = optional(number, 1)
    asg_max                  = optional(number, 2)
    asg_securitygroups       = list(string)
    ssl_certificate_id       = string
    platform_updates_enabled = optional(bool, false)
    instance_logs_enabled    = optional(bool, false)
    deployment_policy        = optional(string, "Immutable")
    jvm_options              = optional(string, "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600")
    eb_settings = optional(list(object({
      namespace = string
      name      = string
      value     = string
    })), [])
  }))

  validation {
    condition     = alltrue([for o in var.beanstalk_environments : contains(["eu-west-1", "eu-west-2", "eu-central-1", "ap-southeast-2", "us-east-1"], o.region)])
    error_message = "Region must be one of eu-west-1, eu-west-2, eu-central-1, ap-southeast-2 or us-east-1"
  }

  validation {
    condition     = alltrue([for o in var.beanstalk_environments : contains(["WebServer", "Worker"], o.tier)])
    error_message = "Tier must be one of WebServer or Worker"
  }
}
