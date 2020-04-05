##creating a kubernetes cluster on EKS
eksctl create cluster \
--name prod \
--region us-east-2 \
--nodegroup-name standard-workers \
--node-type t3.medium \
--nodes 2 \
--nodes-min 1 \
--nodes-max 3 \
--ssh-access \
--ssh-public-key logintokubernetes01 \
--managed