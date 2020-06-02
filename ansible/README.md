run this first
ssh-agent

ssh-add `<path to key file>`

run ansible

ansible-playbook  -i jenkins ./jenkins.yaml --extra-vars "ansible_ssh_user=ec2-user"

NOTE:

the jenkins playbook should sync jenkins credentials, but they may not work if they are crypted on disk

https://codurance.com/2019/05/30/accessing-and-dumping-jenkins-credentials/

is a useful guide if you want to dump the existing credentials and import them.  Else just create new users or reset their passwords then share in Keybase.


NOTE:
Jenkins will restart at boot

