Packer templates for k8s solo
=============================

These are packer templates used to create AWS AMI that run Kubernetes on a single node.
You will need to have [Packer](https://www.packer.io) installed on your local machine and a AWS account.

    $ packer build k8s.json 
    ... 
    ==> amazon-ebs: Creating the AMI: k8s_atomic_single_1446562839
        amazon-ebs: AMI: ami-913fe1e2
    ==> amazon-ebs: Waiting for AMI to become ready...
    ==> amazon-ebs: Terminating the source AWS instance...
    ==> amazon-ebs: Deleting temporary security group...
    ==> amazon-ebs: Deleting temporary keypair...
    Build 'amazon-ebs' finished.

    ==> Builds finished. The artifacts of successful builds are:
    --> amazon-ebs: AMIs were created:

    eu-west-1: ami-913fe1e2

Start an instance using the AMI that was built.

    $ aws ec2 run-instances --image-id ami-913fe1e2 --instance-type t2.micro --key-name k8s

SSH to the running instance and enjoy Kubernetes on a single node

    $ ssh -i ~/.ssh/id_rsa_k8s ubuntu@52.31.45.173

    $ ./kubectl get pods
    NAME                             READY     STATUS    RESTARTS   AGE
    kube-controller-ip-172-31-32-7   5/5       Running   0          1m
    ubuntu@ip-172-31-32-7:~$ ./kubectl get nodes
    NAME             LABELS                                  STATUS
    ip-172-31-32-7   kubernetes.io/hostname=ip-172-31-32-7   Ready

