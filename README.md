Ansible GLT

##### Dependencies
  - Ansible 2.5.1

## The 'snapshot_backup' directory does below things:
1) It will create a snapshot once a day
2) It will check the previous snapshots and it will reach maximum 10


## The 'jenkins_ec2_launch' directory does below things:
1) It will check the latest snapshot
2) It will launch EC2 for Jenkins Master
3) It will make some desired changes on Jenkins Master. Like it will replace the previous private IP.


## The 'glt-supporting-infra-terraform' directory does below things:
1) This directory has contain terraform code to launch AWS Stack follows:
 	- Create KeyPair
    - Create Subnet and VPC
    - It will create IAM and SG for Jenkins Master
    - Launch EC2 for Jenkins Master using Snapshot and custom AMI
    - Create Elastic Load Balancer (ELB) for Jenkins Master
    - Run ansible on Jenkins Master and update SMTP parameter using 'glt-ansible-code' directory
    - Create IAM and SG for Jenkins Slave
    - Launch EC2 for Secure Lab Slave using custom AMI
    - Launch EC2 for Window Server Slave using custom AMI

## The 'glt-supporting-infra-terraform' directory does below things:
1) Run ansible playbook on Jenkins Master and update SMTP parameter and others.
2) As of now, it works with only Terraform code and executed from directory 'glt-supporting-infra-terraform'

## The 'glt-ansible-code' directory does below things:
1) It containe ansible playbook for Jenkins Master Snapshot and Configuration changes
2) It works with 'glt-supporting-infra-terraform' and 'jenkins_ec2_launch'
