# Important note before executing code
It will do two things:
1) Default It will check current Jenkins Master Snapshot. For the desired snapshot pass the variable -e "SNAP_DATE=2018-06-26" for a particular date of the snapshot. (Role: glt-ansible-code/playbooks/roles/snapshot_latest/)
2) It will launch Ec2 only. (Role: jenkins_ec2_launch/roles/jenkins_master/)
3) It will Change previous IP to new Master IP. (Role: glt-ansible-code/playbooks/roles/jenkins_master_changes/)
4) This is the "jenkins_ec2_launch/main.yml" playbook to run perform above things.

 We have specified a role to check desired or latest snapshot of the current Jenkins Master (glt-ansible-code/playbooks/roles/snapshot_latest/tasks/main.yml)
 - A JENKINS_MASTER is the value of TAG Key. It is Default set.
 - Tag_Value_Check: "SNAPSHOT", the value set for TAG Value and it is set by default
 - Set value for SNAP_DATE while executing playbook. Unless it will run latest snapshot with EC2.
 
 To launch EC2 for Jenkins check or set below things before deploy (jenkins_ec2_launch/group_vars/variables)
 - region: us-east-2 (Set Region)
 - image: ami-31ae9754 (this is old AMI, set the latets AMI of Jenkins master and it should be without EBS volume)
 - instance_type: t2.medium (Set instance type)
 - subnet_id: subnet-da38e6a0 (Set Subnet ID)
 -  security_group: jenkins-master-sg (Set Security GROUP name)
 - Name_Tag: Jenkins-Master-NEW (Tage Value for EC2)

 To launch EC2 for Jenkins check or set below things before deploy (glt-ansible-code/playbooks/roles/jenkins_master_changes/tasks/main.yml)
 - - jenkins_home: /var/lib/jenkins (Default set, im jenkins_ec2_launch/main.yml)
 - ansible_ssh_private_key_file: /root/.ssh/terraform-private-key (Update local path of Private Key to run playbook on Jenkins Master - jenkins_ec2_launch/group_vars/variables)

 
 
===============================================================

# How to perform?

 ## Run EC2 With the latest Snapshot of Jenkins master
  	- # cd jenkins_master_launch
  	- # ansible-playbook main.yml
  
 ## Run EC2 With the particular date of  Snapshot for the Jenkins master
  	- # cd jenkins_master_launch
  	- # ansible-playbook main.yml -e "SNAP_DATE=2018-06-28"
