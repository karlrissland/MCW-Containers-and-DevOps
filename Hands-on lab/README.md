# Containers and DevOps Hands-on lab
This hands-on lab is designed to guide you through the process of building and deploying Docker images to the Kubernetes platform hosted on Azure Kubernetes Services (AKS), in addition to learning how to work with dynamic service discovery, service scale-out, and high-availability.

At the end of this lab you will be better able to build and deploy containerized applications to Azure Kubernetes Service and perform common DevOps procedures.

## Containers and DevOps Development Environment
A development environment has been created for you.  You simply need to click the deploy to Azure button to provision it.  This takes roughly 15min to stand up the VM then another 10 min to install and configure the necessary tooling once you log into the VM.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2F<replacevalue>%2Fmaster%2FEnvironments%2FWorkshopEnv.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>

When complete, you should have a fully configured Development workstation in it's own vNet, resource group, pre installed with all the necessary tooling.

## Prerequisites

There are no prerequistes for the deployment.

## Deployment steps

Click the "deploy to Azure" button at the beginning of this document.

Enter vm admin username and password

You can leave default values for the other parameters

NOTE: do not change the value of _artifactsLocation as the deployment will fail.