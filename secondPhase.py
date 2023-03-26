import paramiko
#___ssh to Ansible machine
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(hostname='3.236.146.199', timeout=3, username='ec2-user', key_filename='/home/anhdo/TH_terraform/dev-vpc_test/ssh-keys/anhdo-key')

#___copy playbook files from local machine to Ansible machine
localpath = "/home/anhdo/TH_terraform/dev-vpc_test/user_password.xml"
filepath = "/home/ec2-user/user_password.xml"

localpath2 = "/home/anhdo/TH_terraform/dev-vpc_test/my_playbook.yml"
filepath2 = "/home/ec2-user/remote_my_playbook.yml"

#copy file user_password.xml to Ansible machine
ftp_client = ssh.open_sftp()
ftp_client.put(localpath, filepath)

#copy file my_playbook.yml to Ansible machine
ftp_client = ssh.open_sftp()
ftp_client.put(localpath2, filepath2)

ftp_client.close()

#___run the playbook
#ssh.exec_command(comm2)

stdin, stdout, stderr = ssh.exec_command("sudo ansible-playbook /home/ec2-user/remote_my_playbook.yml")
print(stdout.read().decode("ascii"))
print(stderr.read().decode("ascii"))

print("Run play-book successfully")

ssh.close()