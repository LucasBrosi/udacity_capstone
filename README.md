# udacity_capstone project cloud devops Lucas Brosi

This repository contains all files related to building a jenkins pipeline for building a CI/CI-Pipeline with the following steps:

Starting from a new push in this repository on git hub, it will
1. take the html file (index.html) and lint it using tidy
2. build a docker image with the html site and an nginx environment and push the image as blue image to an online repository
3. deploy the blue image as docker container to an eks kubernetes cluster, running one pod
4. provide a separate endpoint url to test if the blue version is successfully deployed and running. It will ask for a manual approval to proceed.
5. configure the production load balancer to shift incoming traffic to the approved blue version
6. build and push a similar docker image as green image to an online repository
7. deploy the green version
8. reconfigure the production load balancer to the green version.

All the configuration steps called through jenkins use profiles stored in the .json files. EKS-kubectl uses aws cloudformation to build and update the aws vpc ressources described in the .json files.

credits to Alvaro Andres Pinzon Cortes for an excellent tutorial on https://medium.com/@andresaaap/jenkins-pipeline-for-blue-green-deployment-using-aws-eks-kubernetes-docker-7e5d6a401021.




