##creating a kubernetes cluster on EKS
eksctl create cluster \
--name clustercapstone \
--region us-east-2 \
--nodegroup-name standard-workers \
--node-type t2.micro \
--nodes 2 \
--nodes-min 1 \
--nodes-max 5 \
--ssh-access \
--ssh-public-key logintokubernetes01 \
--managed