![](https://github.com/Microsoft/MCW-Template-Cloud-Workshop/raw/master/Media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
Containers and DevOps
</div>

<div class="MCWHeader2">
Before the hands-on lab setup guide
</div>

<div class="MCWHeader3">
March 2019
</div>


Information in this document, including URL and other Internet Web site references, is subject to change without notice. Unless otherwise noted, the example companies, organizations, products, domain names, e-mail addresses, logos, people, places, and events depicted herein are fictitious, and no association with any real company, organization, product, domain name, e-mail address, logo, person, place or event is intended or should be inferred. Complying with all applicable copyright laws is the responsibility of the user. Without limiting the rights under copyright, no part of this document may be reproduced, stored in or introduced into a retrieval system, or transmitted in any form or by any means (electronic, mechanical, photocopying, recording, or otherwise), or for any purpose, without the express written permission of Microsoft Corporation.

Microsoft may have patents, patent applications, trademarks, copyrights, or other intellectual property rights covering subject matter in this document. Except as expressly provided in any written license agreement from Microsoft, the furnishing of this document does not give you any license to these patents, trademarks, copyrights, or other intellectual property.

The names of manufacturers, products, or URLs are provided for informational purposes only and Microsoft makes no representations and warranties, either expressed, implied, or statutory, regarding these manufacturers or the use of the products with any Microsoft technologies. The inclusion of a manufacturer or product does not imply endorsement of Microsoft of the manufacturer or product. Links may be provided to third party sites. Such sites are not under the control of Microsoft and Microsoft is not responsible for the contents of any linked site or any link contained in a linked site, or any changes or updates to such sites. Microsoft is not responsible for webcasting or any other form of transmission received from any linked site. Microsoft is providing these links to you only as a convenience, and the inclusion of any link does not imply endorsement of Microsoft of the site or the products contained therein.

© 2018 Microsoft Corporation. All rights reserved.

**Contents**
<!-- TOC -->

- [Containers and DevOps before the hands-on lab setup guide](#containers-and-devops-before-the-hands-on-lab-setup-guide)
  - [Requirements](#requirements)
  - [Before the hands-on lab](#before-the-hands-on-lab)
    - [Task 1: Prepare your development environment](#task-1-prepare-your-development-environment)
    - [Task 2: Configure your dev environment](#task-2-configure-your-dev-environment)
    - [Task 3: Validate your environment (Optional, everything should be good)](#task-3-validate-your-environment-optional-everything-should-be-good)
    - [Task 4: Setup your Azure DevOps Project](#task-4-setup-your-azure-devops-project)
    - [Task 5: Create Azure Resources needed for the lab](#task-5-create-azure-resources-needed-for-the-lab)

<!-- /TOC -->

# Containers and DevOps before the hands-on lab setup guide

## Requirements

1.  Microsoft Azure subscription must be pay-as-you-go or MSDN.

    - Trial subscriptions will *not* work.

    - You must have rights to create a service principal as discussed in Task 9: Create a Service Principal --- and this typically requires a subscription owner to log in. You may have to ask another subscription owner to login to the portal and execute that step ahead of time if you do not have the rights.

    - You must have enough cores available in your subscription to create the build agent and Azure Kurbernetes Service cluster in Task 5: Create a build agent VM and Task 10: Create an Azure Kubernetes Service cluster. You'll need eight cores if following the exact instructions in the lab, more if you choose additional agents or larger VM sizes. If you execute the steps required before the lab, you will be able to see if you need to request more cores in your sub.

2. A VisualStudio.com account.

3. Local machine or a virtual machine configured with:

    - A browser, preferably Chrome for consistency with the lab implementation tests.

    - Command prompt.

         i.  On Windows, you will be using PowerShell.

         ii. On Mac, all instructions should be executed using bash in Terminal.

4. You will be asked to install other tools throughout the exercises.

## Before the hands-on lab

**Duration**: 30min

You should follow all of the steps provided in this section *before* taking part in the hands-on lab ahead of time as some of these steps take time.

### Task 1: Prepare your development environment

You will deploy the development workstation to your azure subscription.  This will create the resource group you will use throughout this lab as well as your development VM.  The ARM template performs the following;
- Creates a virtual network
- Creates a virtual machine
- Installs Hyper-V on the VM
- Installs Docker-Desktop on the VM

> **Note: Setting up the development machine is optional.  You can isntall the development tools onto your local Windows, MacOSX, or Linux development workstation.**
> 
> **You can find instructions and scripts [here](/Local Machine Setup.md).  When done, skip to Task 4**

1.  Click the "deploy to Azure" Button.  This will take you to the Azure Portal, log you in, and show you the custom template deployment screen prompting you for deployment parameters.  **NOTE:** The default user name is "sysadmin" and the default password is "Password$123".

2.  For the **Resource Group**, select to Create New and enter something like "fabmedical-SUFFIX".

    ![This is a screenshot of the deploy to azure screen showing how to create a new resource group.](media/b4-t1-i1.png)

3.  Check the **I agree to the terms and conditions stated above** checkbox and then click the **Purchase** button.  Deploying the VM should take about 15 minutes.  This is a good time to start reviewing the Hands-on lab step by step documentation.

    ![Shows the ckeckbox and purchase button](media/b4-t1-i2.png)

4. Sit back and wait.  It will take about 15-20min to deploy and configure the development environment.  You can monitor the process via the notifications menu option at the top right of the azure portal.

     ![Shows the notification icon in the Azure portal](media/b4-t1-i3.png)

    You can get more detail about the deployment by clicking the Deployment Process link.

    ![Shows detailed deployment status](media/b4-t1-i4.png)

    When your deployment is complete, you can click the link to the resource group to review the services that have been created and remote into your new dev workstation.

    ![Shows the completed deployment](media/b4-t1-i5.png)
    
>**Note: If you plan on using this workstation for an extended period of time, it is recomended that you turn on [just in time access](https://docs.microsoft.com/en-us/azure/security-center/security-center-just-in-time) to your VM and setup an [auto shutdown policy](https://azure.microsoft.com/en-us/blog/announcing-auto-shutdown-for-vms-using-azure-resource-manager/)**

### Task 2: Configure your dev environment

Your development VM is almost ready.  Once you login for the first time, a script will run that will complete the process.  The script will configure the following;
- Install Goggle Chrome
- Install Postman
- Install Azure CLI
- Install Kubernetes CLI
- Install Helm CLI
- Install Visual Studio Code and add several extensions
- Kick off Docker-Desktop
The script should take about 5 minutes to complete.
> 


1.  From the Azure Portal, select the resource group you created when you deployed the template in Task 1 and click on vmdev01.

    ![Shows provisioned resource group with dev vm highlighted](media/b4-t2-i1.png)

2.  Click connect, download the RDP file, and open the RDP file.
    
    ![Shows dev vm overview with connect button highlighted](media/b4-t2-i2.png)

    ![Shows connect to virtual machine dialog](media/b4-t2-i3.png)

3.  Enter the user name and password you used when you deployed the template.  **Note: choose 'Use a different account' and enter '.\sysadmin' as the user and 'Password$123' as the password if you kept the defaults**

    ![Shows Login Screen](media/b4-t2-i4.png)

    Select 'Yes' on the Remote Desktop Connection Dialog.

    ![Shows RDP connection Dialog](media/b4-t2-i5.png)

4.  Once you login, a script will kick off which will install additional tools.

    ![Shows configuration script kicking off](media/b4-t2-i6.png)


5.  When the script is finished, after about 5min, it will launch Docker-Desktop and copy a script to your desktop.  
    >**Note: The script on your desktop can be used if you need to reinstall some of the tools.**  

    Click "OK" in the Docker Desktop dialog that stats support is depricated.  This will start docker on the development machine.

    ![Shows Docker Desktop Deprication Dialog](media/b4-t2-i7.png)

    ![Shows Docker Starting](media/b4-t2-i8.png)

6. After about 5min You will be prompted to login to Docker.  If you don't have a docker account and don't want to create one, you can simply close the dialog.  Docker is now up and running.
    
    ![Shows docker welcome](media/b4-t2-i9.png)

### Task 3: Validate your environment (Optional, everything should be good)

We are going to run a couple of tests to make sure your environment is setup correctly.  We are going to;
- Open Visual Studio Code
- Open a PowerShell Terminal Window
- Verify we can run a docker container
- Verify we have various command line tools installed and running

1. Verify you have Google Chrome, Setup_tools, Visual studio Code, and Postman installed by noting the shortcuts have been placed on your desktop.

    ![Shows Desktop icons](media/b4-t3-i1.png)

2. Open Visual Studio Code (the blue icon) and verify extensions are installed.
     >**Note: VSCode will open a browser window which will prompt you to choose your default browser, select Chrome and click OK.**

     ![Shows Browser Default Dialog](media/b4-t3-i2.png)

     Next, verify VSCode is showing the three icons highlighted below.  These represent your Azure, Kubernetes, and Docker extensions.

     ![Shows VSCode Extensions](media/b4-t3-i3.png)

3. Open a terminal window in VSCode and configure PowerShell as your default terminal
   
   ![Shows opening the VSCode terminal](media/b4-t3-i4.png)

   ![Shows the VSCode terminal window with powershell selected](media/b4-t3-i5.png)

4. Test docker by entering 'docker run hello-world' in the terminal window.  You should see the message "Hello from Docker!"
   
   ![Shows running a docker command](media/b4-t3-i6.png)

   Next click on the Docker extension in visual studio code and expand the images node and the containers node to verify the extension is working.  You should see the hello-world container and a stopped container instance.

   ![Shows the docker extension](media/b4-t3-i6a.png)

5. Enter 'az' in the terminal window to verify the azure command line tool.  You should see help information as a response.
   
   ![Shows running the Azure Command](media/b4-t3-i7.png)

6. Enter 'kubectl' in the terminal window to verify the kubernetes command line tool.  You should see help information as a response.
   
   ![Shows running the kubernetes command](media/b4-t3-i8.png)

7. Enter 'helm' in the terminal window to verify the helm command line tool.  You should see help information as a response.
   
   ![Shows running the helm command](media/b4-t3-i9.png)

### Task 4: Setup your Azure DevOps Project
This task will walk you through creating a new Azure DevOps project and uploading the FabMedical starter files.

>**Note: If you do not yet have an Azure DevOps project, it is easy and free to sign up.  Azure DevOps is free to use for teams of up to 5 users and for open source projects, free for an unlimited number of users.  To Create a new tenant, go to visualstudio.com, login, and create your new organization.**

**NOTE: if you already have and use an Azure DevOps tennant, you can skip to step 4d and use it as long as you have the ability to create new projects and build/release pipelines.**

1. go to visualstudio.com and login.
   
    ![Shows visual studio login page](media/b4-t4-i1.png)

2. create new project.
    
    ![Shows create project button](media/b4-t4-i2.png)

    Enter FabMedicalWorkshop for your project name and then click 'Create'.

    ![Shows Create project dialog](media/b4-t4-i3.png)

    ![Shows the project landing page](media/b4-t4-i4.png)

3. To upload the FabMedical starter files to the repo, we need to initialize the local repo, add the changes, connect to the remote repository, and then push our code.

    Open file explorer and navigate to C:\Source.  Right click the FabMedical directory and select to 'Open with Code'.

    ![Shows the file explorer](media/b4-t4-i5.png)

    In visual studio code, open a new terminal window.

    ![Shows opening the terminal window](media/b4-t4-i6.png)

    In the terminal window, you will enter the following commands

    `git init`

    ![Shows executing git init](media/b4-t4-i7.png)

    `git config --global user.email "youremail@yourcompany.com"`

    `git config --global user.name "yourname"`

    ![shows adding global config](media/b4-t4-i8.png)

    `git add --all`

    ![shows adding all the files](media/b4-t4-i9.png)

    `git commit -m "initial commit" --all`

    ![shows commiting all the files](media/b4-t4-i10.png)

    Go back to Azure DevOps and click on the repo icon in the left menu to retrieve the commands necessary to connect your local repo to your azure DevOps repo and push your files to Azure DevOps.  The commands you need to copy are highlighted.

    ![shows the repo icon in azure devops](media/b4-t4-i11.png)

    ![shows clone information for the azure devops repo](media/b4-t4-i12.png)

    Go back to visual studio code and past the commands into the terminal window and hit enter.  This will connect your local repo to azure devOps and start to push your files..

    ![shows connecting and pushing the code](media/b4-t4-i13.png)

    You will be asked to login before you can push files to the remote server.

    ![shows authenticating against azure devops](media/b4-t4-i14.png)

    After logging in, the files should start uploading.

    ![shows files uploading to azure devops](media/b4-t4-i15.png)

    Going back to Azure DevOps and refreshing the page will show the files you just uploaded.

    ![shows files in azure devops](media/b4-t4-i16.png)

4. Connect Visual Studio Code to Azure DevOps (Optional).  This will provide more information about bugs, work items, and builds withing your Visual Studio Code environment.

    Click the 'Team' Icon in the lower left.

    ![Shows the team icon](media/b4-t4-i17.png)

    Select to 'Authenticate and get and access token automatically'.

    ![Shows the command menu](media/b4-t4-i18.png)

    Copy the token and then hit enter.

    ![Shows the access code](media/b4-t4-i19.png)

    Paste your token into the Device Login Page and click continue to authenticate.

    ![Shows the device auth screen](media/b4-t4-i20.png)

    When done, you will see additional information in the lower left of Visual Studio Code relating to Azure DevOps.

    ![Shows the connected experience](media/b4-t4-i21.png)



### Task 5: Create Azure Resources needed for the lab

The lab uses several Azure services.  In this task we will use the Azure CLI to deploy the services into the resource group you created in step 1.  We will create the following in your Azure subscription;
- Azure Service Principle
- Azure Container Registry
- Azure Kubernetes Cluster
- Azure CosmosDB

>**Note: All of these resources could have been provisioned with the development workstation.  It was a choice to have you manually provision the resources to gain exposure to the Azure CLI.**

1. Open Visual Studio Code and Open a PowerShell terminal window.
   
    ![Shows opening the terminal window](media\b4-t5-i1.png)

    ![Shows the terminal window configured as powershell](media\b4-t5-i2.png)

2. Login to your azure subscription with the Azure CLI.

    ![](media\b4-t5-i3.png)
    ![](media\b4-t5-i4.png)
    ![](media\b4-t5-i5.png)

3. (Optional) If you are using your local development workstation, you will need to create a resourcegroup 
   `az group create --name <myresourcegroupname>`
   ![Shows the creation of the resource group](media\b4-t5-i6.png)

4. Create an Azure Container Registry by executing the following command in the terminal window
   `az acr create --resource-group <resourceGroupName> --name <containerRegistryName> --sku basic`
   ![Shows the creation of the container registry](media\b4-t5-i7.png)

5. Create an Azure Kubernetes Cluster by executing the following command in the terminal window


    `az aks create --resource-group <yours> --name fabmedAKSCluster --node-count 2 --enable-addons monitoring --generate-ssh-keys`

    
    ![Shows the creation of the kubernetes cluster](media\b4-t5-i8.png)

    >**Note: this takes a little while**

    ![Shows AKS deployment complete](media\b4-t5-i9.png)

6. Create an Azure CosmosDB instance by executing the following command in the terminal window
   
    `az cosmosdb create --resource-group <yours> --name FabMedCosmos --kind MongoDB --locations "East US" --default-consistency-level "ConsistentPrefix"`
    ![Shows the creation of CosmosDB](media\b4-t5-i10.png)

    >**Note: this takes a few moments**

    ![Shows cosmos db complete provision](media\b4-t5-i11.png)

7. Go to the Azure Portal and take a look at your resource group to verify the services have been created.

    ![Shows the resource group with all the provisioned services](media\b4-t5-i12.png)


> **Note: If you experience errors related to lack of available cores, you may have to delete some other compute resources or request additional cores to your subscription and then try this again.**

You should follow all steps provided *before* performing the Hands-on lab.
