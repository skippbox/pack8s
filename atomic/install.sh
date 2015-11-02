#!/bin/bash

mv /tmp/config /etc/kubernetes/config
mv /tmp/apiserver /etc/kubernetes/apiserver

for s in etcd kube-apiserver kube-controller-manager kube-scheduler kube-proxy kubelet; do
    systemctl restart $s
    systemctl enable $s
    systemctl status $s
done
