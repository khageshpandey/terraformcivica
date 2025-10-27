env = "development"

beanstalk_environments = {
  #Frankfurt Dev environments
  devadmin-al23-0 = {
    region                   = "eu-central-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.7.4 running Tomcat 10 Corretto 21"
    application_name         = "UAT iCasework"
    version_label            = ""
    keypair                  = "uat-al2023-key"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-05a36b7d8fa2fb968"
    application_subnets      = ["subnet-0bc29e5bc66f85834", "subnet-098e277f938adf5ec"]
    loadbalancer_subnets     = ["subnet-003e492332b52ba8f", "subnet-00d3f2574455fe4e9"]
    asg_securitygroups       = ["sg-08e149d944648bc84"]
    ssl_certificate_id       = "arn:aws:acm:eu-central-1:555124824930:certificate/fd20e47d-47ff-402b-8bb7-b73369aa603f"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 1
    asg_max                  = 2
    deployment_policy        = "Immutable"
    jvm_options              = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600 -XX:NativeMemoryTracking=summary -XX:+PrintGCDetails"
    eb_settings = [
      {
        namespace = "aws:elasticbeanstalk:application:environment"
        name      = "CODEGURU_PROFILE_GROUP"
        value     = "iCasework-eu-central-1"
      }
    ]
  },
  devadmin-al23-1 = {
    region                   = "eu-central-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.6.0 running Tomcat 10 Corretto 21"
    application_name         = "UAT iCasework"
    version_label            = "icasework-v10.2-c6d67db"
    keypair                  = "uat-al2023-key"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-05a36b7d8fa2fb968"
    application_subnets      = ["subnet-0bc29e5bc66f85834", "subnet-098e277f938adf5ec"]
    loadbalancer_subnets     = ["subnet-003e492332b52ba8f", "subnet-00d3f2574455fe4e9"]
    asg_securitygroups       = ["sg-08e149d944648bc84"]
    ssl_certificate_id       = "arn:aws:acm:eu-central-1:555124824930:certificate/fd20e47d-47ff-402b-8bb7-b73369aa603f"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 1
    asg_max                  = 2
    deployment_policy        = "Immutable"
    jvm_options              = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600 -XX:NativeMemoryTracking=summary -XX:+PrintGCDetails"
    eb_settings = [
      {
        namespace = "aws:elasticbeanstalk:application:environment"
        name      = "CODEGURU_PROFILE_GROUP"
        value     = "iCasework-eu-central-1"
      }
    ]
  },
  devadmin-al23-3 = {
    region                   = "eu-central-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.6.0 running Tomcat 10 Corretto 21"
    application_name         = "UAT iCasework"
    version_label            = "icasework-v10.1.3-a935b4f"
    keypair                  = "uat-al2023-key"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-05a36b7d8fa2fb968"
    application_subnets      = ["subnet-0bc29e5bc66f85834", "subnet-098e277f938adf5ec"]
    loadbalancer_subnets     = ["subnet-003e492332b52ba8f", "subnet-00d3f2574455fe4e9"]
    asg_securitygroups       = ["sg-08e149d944648bc84"]
    ssl_certificate_id       = "arn:aws:acm:eu-central-1:555124824930:certificate/fd20e47d-47ff-402b-8bb7-b73369aa603f"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 1
    asg_max                  = 2
    deployment_policy        = "Immutable"
    jvm_options              = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600 -XX:NativeMemoryTracking=summary -XX:+PrintGCDetails"
    eb_settings              = []
  },
  devadmin-al23-4 = {
    region                   = "eu-central-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.6.0 running Tomcat 10 Corretto 21"
    application_name         = "UAT iCasework"
    version_label            = "icasework-v10.0.1.17-bc58a70"
    keypair                  = "uat-al2023-key"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-05a36b7d8fa2fb968"
    application_subnets      = ["subnet-0bc29e5bc66f85834", "subnet-098e277f938adf5ec"]
    loadbalancer_subnets     = ["subnet-003e492332b52ba8f", "subnet-00d3f2574455fe4e9"]
    asg_securitygroups       = ["sg-08e149d944648bc84"]
    ssl_certificate_id       = "arn:aws:acm:eu-central-1:555124824930:certificate/fd20e47d-47ff-402b-8bb7-b73369aa603f"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 1
    asg_max                  = 2
    deployment_policy        = "Immutable"
    jvm_options              = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600 -XX:NativeMemoryTracking=summary -XX:+PrintGCDetails"
    eb_settings              = []
  },
  devportal-al23-0 = {
    region                   = "eu-central-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.7.4 running Tomcat 10 Corretto 21"
    application_name         = "UAT iCasework"
    version_label            = ""
    keypair                  = "uat-al2023-key"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-05a36b7d8fa2fb968"
    application_subnets      = ["subnet-0bc29e5bc66f85834", "subnet-098e277f938adf5ec"]
    loadbalancer_subnets     = ["subnet-003e492332b52ba8f", "subnet-00d3f2574455fe4e9"]
    asg_securitygroups       = ["sg-08e149d944648bc84"]
    ssl_certificate_id       = "arn:aws:acm:eu-central-1:555124824930:certificate/fd20e47d-47ff-402b-8bb7-b73369aa603f"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 1
    asg_max                  = 2
    deployment_policy        = "Immutable"
    jvm_options              = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600 -XX:NativeMemoryTracking=summary -XX:+PrintGCDetails"
    eb_settings              = []
  },
  devportal-al23-1 = {
    region                   = "eu-central-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.6.0 running Tomcat 10 Corretto 21"
    application_name         = "UAT iCasework"
    version_label            = "icasework-v10.1.0-94295b3"
    keypair                  = "uat-al2023-key"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-05a36b7d8fa2fb968"
    application_subnets      = ["subnet-0bc29e5bc66f85834", "subnet-098e277f938adf5ec"]
    loadbalancer_subnets     = ["subnet-003e492332b52ba8f", "subnet-00d3f2574455fe4e9"]
    asg_securitygroups       = ["sg-08e149d944648bc84"]
    ssl_certificate_id       = "arn:aws:acm:eu-central-1:555124824930:certificate/fd20e47d-47ff-402b-8bb7-b73369aa603f"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 1
    asg_max                  = 2
    deployment_policy        = "Immutable"
    jvm_options              = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600 -XX:NativeMemoryTracking=summary -XX:+PrintGCDetails"
    eb_settings              = []
  },
  #Train environments
  trainadmin-al23-0 = {
    region                   = "eu-central-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.4.3 running Tomcat 10 Corretto 21"
    application_name         = "UAT iCasework"
    version_label            = "icasework-v10.2-baead05"
    keypair                  = "uat-al2023-key"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-05a36b7d8fa2fb968"
    application_subnets      = ["subnet-0bc29e5bc66f85834", "subnet-098e277f938adf5ec"]
    loadbalancer_subnets     = ["subnet-003e492332b52ba8f", "subnet-00d3f2574455fe4e9"]
    asg_securitygroups       = ["sg-08e149d944648bc84"]
    ssl_certificate_id       = "arn:aws:acm:eu-central-1:555124824930:certificate/fd20e47d-47ff-402b-8bb7-b73369aa603f"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 1
    asg_max                  = 2
    deployment_policy        = "Immutable"
    jvm_options              = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600 -XX:NativeMemoryTracking=summary -XX:+PrintGCDetails"
    eb_settings              = []
  },
  trainportal-al23-0 = {
    region                   = "eu-central-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.4.3 running Tomcat 10 Corretto 21"
    application_name         = "UAT iCasework"
    version_label            = "icasework-v10.2-baead05"
    keypair                  = "uat-al2023-key"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-05a36b7d8fa2fb968"
    application_subnets      = ["subnet-0bc29e5bc66f85834", "subnet-098e277f938adf5ec"]
    loadbalancer_subnets     = ["subnet-003e492332b52ba8f", "subnet-00d3f2574455fe4e9"]
    asg_securitygroups       = ["sg-08e149d944648bc84"]
    ssl_certificate_id       = "arn:aws:acm:eu-central-1:555124824930:certificate/fd20e47d-47ff-402b-8bb7-b73369aa603f"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 1
    asg_max                  = 2
    deployment_policy        = "Immutable"
    jvm_options              = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600 -XX:NativeMemoryTracking=summary -XX:+PrintGCDetails"
    eb_settings              = []
  },
  #UAT environments
  uatadmin-al23-0 = {
    region                   = "eu-central-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.6.0 running Tomcat 10 Corretto 21"
    application_name         = "UAT iCasework"
    version_label            = ""
    keypair                  = "uat-al2023-key"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-ad0f59c4"
    application_subnets      = ["subnet-c30e25aa", "subnet-e6014f9d"]
    loadbalancer_subnets     = ["subnet-92014fe9", "subnet-9f0e25f6"]
    asg_securitygroups       = [""]
    ssl_certificate_id       = "arn:aws:acm:eu-central-1:555124824930:certificate/fd20e47d-47ff-402b-8bb7-b73369aa603f"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 2
    asg_max                  = 3
    deployment_policy        = "Immutable"
    jvm_options              = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600 -XX:NativeMemoryTracking=summary -XX:+PrintGCDetails"
    eb_settings              = []
  },
  uatportal-al23-0 = {
    region                   = "eu-central-1"
    solution_stack_name      = "64bit Amazon Linux 2023 v5.6.0 running Tomcat 10 Corretto 21"
    application_name         = "UAT iCasework"
    version_label            = ""
    keypair                  = "uat-al2023-key"
    ec2_instance_type        = "m5.large"
    vpc_id                   = "vpc-ad0f59c4"
    application_subnets      = ["subnet-c30e25aa", "subnet-e6014f9d"]
    loadbalancer_subnets     = ["subnet-92014fe9", "subnet-9f0e25f6"]
    asg_securitygroups       = [""]
    ssl_certificate_id       = "arn:aws:acm:eu-central-1:555124824930:certificate/fd20e47d-47ff-402b-8bb7-b73369aa603f"
    platform_updates_enabled = false
    instance_logs_enabled    = false
    asg_min                  = 2
    asg_max                  = 3
    deployment_policy        = "Immutable"
    jvm_options              = "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=1098 -Dorg.apache.july.logging.UserDataHelper.SUPPRESSION_TIME=3600 -XX:NativeMemoryTracking=summary -XX:+PrintGCDetails"
    eb_settings              = []
  }
}
