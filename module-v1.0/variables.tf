variable "environment" {
  description = "Name of the Elastic Beanstalk environment."
  type        = string
}

variable "application_name" {
  description = "Name of the Elastic Beanstalk application."
  type        = string

}

variable "solution_stack_name" {
  description = "Elastic Beanstalk solution stack name."
  type        = string
  default     = "64bit Amazon Linux 2023 v5.3.2 running Tomcat 10 Corretto 21"
}

variable "version_label" {
  description = "Elastic Beanstalk application version label."
  type        = string
}

variable "tier" {
  description = "Elastic Beanstalk environment tier."
  type        = string
  default     = "WebServer"

  validation {
    condition     = contains(["WebServer", "Worker"], var.tier)
    error_message = "The tier must be either 'WebServer' or 'Worker'."
  }
}

variable "ec2_instance_type" {
  description = "EC2 instance type."
  type        = string
  default     = "m5.large"
}

variable "ec2_enable_spot" {
  description = "Enable EC2 spot instances."
  type        = bool
  default     = false
}

variable "keypair" {
  description = "EC2 keypair name."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID."
  type        = string
}

variable "application_subnets" {
  description = "List of application subnets."
  type        = list(string)
}

variable "loadbalancer_subnets" {
  description = "List of load balancer subnets."
  type        = list(string)
}

variable "asg_min" {
  description = "Autoscaling group minimum size."
  type        = number
  default     = 1
}

variable "asg_max" {
  description = "Autoscaling group maximum size."
  type        = number
  default     = 2
}

variable "asg_securitygroups" {
  description = "List of security groups for the autoscaling group."
  type        = list(string)
}

variable "ssl_certificate_id" {
  description = "SSL certificate ARN."
  type        = string
}

variable "platform_updates_enabled" {
  description = "Enable platform updates."
  type        = bool
  default     = false
}

variable "instance_logs_enabled" {
  description = "Enable EC2 instance logging."
  type        = bool
  default     = false
}

variable "deployment_policy" {
  description = "Elastic beanstalk deployment policy"
  type        = string
  default     = "Immutable"
}

variable "jvm_options" {
  description = "JVM Options"
  type        = string
  default     = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600"
}

variable "eb_settings" {
  description = "List of Elastic Beanstalk settings."
  type = list(object({
    namespace = string
    name      = string
    value     = string
  }))
  default = []
}
