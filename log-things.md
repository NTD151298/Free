# To install git on window
https://git-scm.com/download/win
git config --global user.email "sieudenoo1512@gmail.com"
git config --global user.name "NTD1512"
git pull free main
git fetch free
git remote add devops-learn https://github.com/NTD151298/Devop_FPT_Foundation.git
git fetch devops-learn
git pull devops-learn main --allow-unrelated-histories
git config --global user.name "NTD1512"
git config --global user.email "sieudenoo1512@gmail.com"
ssh -p 2000 abc@127.0.0.1

# Install docker
#!/bin/bash
# First, update your existing list of packages:
sudo apt update
# Next, install a few prerequisite packages which let apt use packages over HTTPS:
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
# Then add the GPG key for the official Docker repository to your system:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# Add the Docker repository to APT sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Update your existing list of packages again for the addition to be recognized:
sudo apt update
# Make sure you are about to install from the Docker repo instead of the default Ubuntu repo:
apt-cache policy docker-ce
echo "You ll see output like this, although the version number for Docker may be different:"
echo "Output of apt-cache policy docker-ce"
echo "docker-ce:"
echo "  Installed: (none)"
echo "  Candidate: 5:20.10.14~3-0~ubuntu-jammy"
echo "  Version table:"
echo "     5:20.10.14~3-0~ubuntu-jammy 500"
echo "        500 https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages"
echo "     5:20.10.13~3-0~ubuntu-jammy 500"
echo "        500 https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages"
echo " "
echo " "
# Notice that docker-ce is not installed, but the candidate for installation is from the Docker repository for Ubuntu 22.04 (jammy).
# Finally, install Docker:
sudo apt install -y docker-ce
# Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it’s running:
echo "The output should be similar to the following, showing that the service is active and running:"
echo "Output"
echo "● docker.service - Docker Application Container Engine"
echo "     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)"
echo "     Active: active (running) since Fri 2022-04-01 21:30:25 UTC; 22s ago"
echo "TriggeredBy: ● docker.socket"
echo "       Docs: https://docs.docker.com"
echo "   Main PID: 7854 (dockerd)"
echo "      Tasks: 7"
echo "     Memory: 38.3M"
echo "        CPU: 340ms"
echo "     CGroup: /system.slice/docker.service"
echo "             └─7854 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock"
echo " "
echo " "
sudo systemctl status docker
# If you want to avoid typing sudo whenever you run the docker command, add your username to the docker group:
sudo usermod -aG docker $USER
groups $USER
docker ps 
# Docker compose
sudo apt  install docker-compose
docker-compose up -d
# Docker copose file jenkins container
version: '3.7'
services:
  jenkins:
    image: duongtn1512/jenkins_docker:v1
    privileged: true
    user: root
    ports:
      - 50000:50000
      - 8080:8080
    container_name: jenkins
    volumes:
      - ~/jenkins:/var/jenkins_home
      - /var/run/docker.sock:/var/run/docker.sock
      - /usr/local/bin/docker:/usr/local/bin/docker
