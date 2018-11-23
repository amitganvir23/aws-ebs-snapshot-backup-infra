resource "null_resource" "jenkins-ansible-master-call" {
provisioner "local-exec" {
      command = "sleep 2m;ansible-playbook ../../glt-ansible-code/playbooks/jenkins-master.yml --private-key=/root/.ssh/terraform-private-key -i ../../glt-ansible-code/hosts/ec2.py -e slave_subnet=${var.pub_sub_id} -e slave_sg=${var.jenkins_slave_sg} -e slave_ami=${var.slave_ami} -e slave_tag=${var.slave_tag} -e slave_iam=${var.slave_iam} -e region=${var.region} -e master_hostname=tag_Name_${var.jenkins_tag_value}"

}
}