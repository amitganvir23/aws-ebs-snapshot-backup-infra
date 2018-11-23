resource "aws_instance" "jenkins-master" {
    ami                         = "${var.jenkins-master-ami}"
    instance_type               = "${var.jenkins_master_instance_type}"
    key_name                    = "${var.aws_key_name}"
    vpc_security_group_ids      = ["${aws_security_group.jenkins-master-sg.id}"]
    #count                      = "${length(var.public_sub_cidr)}"
     count 			= "1"
    #user_data                  = "${data.template_file.userdata-jenkins.rendered}"
    subnet_id                   = "${var.pub_sub_id}"
    associate_public_ip_address = true
    source_dest_check           = false
    // Implicit dependency
    iam_instance_profile        = "${aws_iam_instance_profile.jenkins_profile.name}"
    ebs_block_device {
                    snapshot_id = "${var.snap_id}"
                    device_name = "/dev/sdg"
                    volume_type = "gp2"
                     }
     volume_tags = {
                    Name = "Jenkins_Master"
                   }

    tags = {
     	      Name        = "${var.jenkins_tag_value}"
	      Role        = "jenkins"
	      Environment = "${var.environment}"
	      Stack       = "Supporting-GLT"
	    }

}
