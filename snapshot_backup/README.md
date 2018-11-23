# Important note before executing code
It will do two things:
1) It will create a snapshot once a day
2) It will check the previous snapshot when it reached maximum snapshot default 10

 To create a snaphot specify your valeus in ansible file (snapshot_backup.yml)
 - REGION: 
 - instance_ID
 - volume_ID	(Volume ID of current running Jenkins Master)
 - device_NAME  ()
 - Snap_Description
 - Snap_Tag_Value: "{{DATE}}" (Default value specify to maintain snaphsot)
 
 To delete a snapshot specify your values in ansible file (snapshot_backup.yml)
 - Tag_Value_Check: "SNAPSHOT"  (This is Default tag value and JENKINS_MASTER is default tag key for all Snapshot to identify)
 - Max_Snapshot: 10 (the Maximum snapshot can keep)

  
===============================================================

# How to perform Snapshot
  	- # cd jenkins-upgrade-terraform/backup_snapshot
  	- # ansible-playbook snapshot_backup.yml
