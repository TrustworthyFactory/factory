sudo apt-get update

sudo apt-get install openssh-server 
sudo sed -i 's/X11Forwarding no/X11Forwarding yes/' /etc/ssh/sshd_config
/etc/init.d/ssh restart 

sudo apt-get install docker.io
update-rc.d docker.io defaults

docker pull fiware/docker-trustworthyfactory
