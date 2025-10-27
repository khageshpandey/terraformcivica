terraform {
  required_version = "1.8.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

data "aws_caller_identity" "current" {}

resource "aws_elastic_beanstalk_environment" "environment" {
  name                = var.environment
  application         = var.application_name
  solution_stack_name = var.solution_stack_name
  version_label       = var.version_label
  tier                = var.tier

  ## EC2 Instance Settings
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = var.ec2_instance_type
    resource  = ""
  }

  setting {
    name      = "SupportedArchitectures"
    namespace = "aws:ec2:instances"
    resource  = null
    value     = "x86_64"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.keypair
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "EnableSpot"
    value     = var.ec2_enable_spot
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
    resource  = ""
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", sort(var.application_subnets))
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "arn:aws:iam::${data.aws_caller_identity.current.id}:role/aws-elasticbeanstalk-service-role"
    resource  = ""
  }

  # Autoscaling Settings
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = true
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.asg_min
    resource  = ""
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.asg_max
    resource  = ""
  }

  setting {
    name      = "SecurityGroups"
    namespace = "aws:autoscaling:launchconfiguration"
    value     = join(",", sort(var.asg_securitygroups))
    resource  = null
  }

  setting {
    name      = "MeasureName"
    namespace = "aws:autoscaling:trigger"
    resource  = null
    value     = "CPUUtilization"
  }

  setting {
    name      = "UpperThreshold"
    namespace = "aws:autoscaling:trigger"
    resource  = null
    value     = "80"
  }

  setting {
    name      = "LowerThreshold"
    namespace = "aws:autoscaling:trigger"
    resource  = null
    value     = "5"
  }

  setting {
    name      = "Unit"
    namespace = "aws:autoscaling:trigger"
    resource  = null
    value     = "Percent"
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSize"
    value     = 30
    resource  = ""
  }

  # ELB Settings
  setting {
    name      = "LoadBalancerType"
    namespace = "aws:elasticbeanstalk:environment"
    resource  = null
    value     = "application"
  }

  setting {
    namespace = "aws:elbv2:listener:default"
    name      = "ListenerEnabled"
    value     = false
  }

  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "Protocol"
    value     = "HTTPS"
  }

  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "SSLCertificateArns"
    value     = var.ssl_certificate_id
  }

  setting {
    namespace = "aws:elbv2:listener:443"
    name      = "SSLPolicy"
    value     = "ELBSecurityPolicy-TLS-1-2-2017-01"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = join(",", sort(var.loadbalancer_subnets))
  }

  setting {
    name      = "StickinessEnabled"
    namespace = "aws:elasticbeanstalk:environment:process:default"
    resource  = null
    value     = true
  }

  # Environment Variables
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "ENV_NAME"
    value     = var.environment
    resource  = ""
  }

  # Deployment
  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = true
    resource  = ""
  }

  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "DeploymentPolicy"
    value     = var.deployment_policy
    resource  = ""
  }

  setting {
    name      = "ProxyServer"
    namespace = "aws:elasticbeanstalk:environment:proxy"
    resource  = null
    value     = "apache"
  }

  setting {
    name      = "UpdateLevel"
    namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
    resource  = null
    value     = "minor"
  }

  setting {
    name      = "RollingUpdateType"
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    resource  = null
    value     = "Health"
  }

  # Platform Software
  setting {
    name      = "ManagedActionsEnabled"
    namespace = "aws:elasticbeanstalk:managedactions"
    resource  = null
    value     = var.platform_updates_enabled
  }

  setting {
    name      = "PreferredStartTime"
    namespace = "aws:elasticbeanstalk:managedactions"
    resource  = null
    value     = "Sat:05:46"
  }

  setting {
    name      = "StreamLogs"
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    resource  = null
    value     = var.instance_logs_enabled
  }

  setting {
    name      = "RetentionInDays"
    namespace = "aws:elasticbeanstalk:cloudwatch:logs"
    resource  = null
    value     = "90"
  }

  setting {
    name      = "Xms"
    namespace = "aws:elasticbeanstalk:container:tomcat:jvmoptions"
    resource  = null
    value     = "4096m"
  }
  setting {
    name      = "Xmx"
    namespace = "aws:elasticbeanstalk:container:tomcat:jvmoptions"
    resource  = null
    value     = "4096m"
  }

  setting {
    name      = "JVM Options"
    namespace = "aws:elasticbeanstalk:container:tomcat:jvmoptions"
    resource  = null
    value     = var.jvm_options
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "DisableIMDSv1"
    value     = "true"
  }

  dynamic "setting" {
    for_each = var.eb_settings
    content {
      namespace = setting.value["namespace"]
      name      = setting.value["name"]
      value     = setting.value["value"]
    }
  }

}
