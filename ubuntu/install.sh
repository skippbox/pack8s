#!/bin/bash

sudo apt-get update
curl -sSL https://get.docker.com/ | sudo sh
sudo gpasswd -a ubuntu docker
sudo service docker restart
sudo mkdir -p /etc/kubernetes/manifests

curl -sO https://storage.googleapis.com/kubernetes-release/release/v1.0.3/bin/linux/amd64/kubelet
curl -sO https://storage.googleapis.com/kubernetes-release/release/v1.0.3/bin/linux/amd64/kubectl
chmod +x kubectl

sudo mv kubelet /usr/bin/kubelet 
sudo chmod +x /usr/bin/kubelet
sudo mv /tmp/kubelet.service /etc/systemd/system/kubelet.service
sudo mv /tmp/kubernetes.yaml /etc/kubernetes/manifests/kubernetes.yaml

sudo systemctl daemon-reload
sudo systemctl start kubelet
sudo systemctl enable kubelet

