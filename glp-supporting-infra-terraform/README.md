# Important note before executing code
1) This is terraform code to launch AWS Stack follows:
 	- Create KeyPair
    - Create Subnet and VPC
    - It will create IAM and SG for Jenkins Master
    - Launch EC2 for Jenkins Master using Snapshot and custom AMI
    - Create Elastic Load Balancer (ELB) for Jenkins Master
    - Run ansible on Jenkins Master and update SMTP parameter using 'glt-ansible-code' directory
    - Create IAM and SG for Jenkins Slave
    - Launch EC2 for Secure Lab Slave using custom AMI
    - Launch EC2 for Window Server Slave using custom AMI

2) Before applying the changes update your information or values in the "terraform.tfvars" file to create an Infrastructure. see the below things as an example.

3) See some variable for AWS Infra
 	- region  		= "us-east-2"
    - vpc_name      = "GLT-jenkins-Infra"
    - vpc_cidr      = "172.168.0.0/16"
    - environment   = "support"
    - Public/Private CIDR, Zones, 
    
4) See some variable for Jenkins Master
	- jenkins_master_instance_type    = "t2.xlarge"
	- aws_key_name                    = "terraform-support-keys"
	- jenkins-master-ami              = "ami-31ae9754"
	- snap_id                         = "snap-02303402e02598c08"

5) See some variable for Jenkins-slave for dynamic
	- jenkins_slave_sg        = "jenkins-slave-sg"
	- slave_ami               = "ami-54e1da34"
	- slave_tag               = "JenkinsDynamicSlaves-EFS-29-JUNE"

6) See some variable for Jenkins saurcelab Slave
	- jenkins_saurcelab_instance_type = "t2.medium"
	- jenkins_saurcelab_ami           = "ami-5ae6dd3a"
    
7) See some variable for Jenkins Windows server Slave
	- jenkins_win_server_instance_type        = "m4.xlarge"
	- jenkins_win_server_ami                  = "ami-81e6dde1"

  
===============================================================

# How to perform Snapshot
  	- # cd glt-supporting-infra-terraform/stack-deployment
  	- # terraform plan
    - # terraform apply
