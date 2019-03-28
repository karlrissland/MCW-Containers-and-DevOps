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
    - [Task 2: Configur your dev environment](#task-2-configur-your-dev-environment)
    - [Task 3: Validate your environment](#task-3-validate-your-environment)
    - [Task 4: Setup your Azure DevOps Account](#task-4-setup-your-azure-devops-account)
    - [Task 5: Create Azure Resources needed for the lab](#task-5-create-azure-resources-needed-for-the-lab)
    - [Task 9: Create a Service Principal](#task-9-create-a-service-principal)
    - [Task 10: Create an Azure Kubernetes Service cluster](#task-10-create-an-azure-kubernetes-service-cluster)
    - [Task 13: Download the FabMedical starter files](#task-13-download-the-fabmedical-starter-files)

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

1.  Click the "deploy to Azure" Button.  This will take you to the Azure Portal, log you in, and show you the custom template deployment screen prompting you for deployment parameters.

2.  For the **Resource Group**, select to Create New and enter something like "fabmedical-SUFFIX".

    ![This is a screenshot of the deploy to azure screen showing how to create a new resource group.](media/na.png)

3.  Enter the **Admin User Name** and **Admin User Password** or accept the user "sysadmin" and the default password "Password$123".

    ![Shows where to add user name and password.](media/na.png)

4.  Check the **I agree to the terms and conditions stated above** checkbox and then click the **Purchase** button.  Deploying the VM should take about 15 minutes.  This is a good time to start reviewing the Hands-on lab step by step documentation.

    ![Shows the ckeckbox and purchase button](media/na.png)


### Task 2: Configur your dev environment

Your development VM is almost ready.  Once you login for the first time, a script will run that will complete the process.  The script will configure the following;
- Install Goggle Chrome
- Install Postman
- Install Azure CLI
- Install Kubernetes CLI
- Install Helm CLI
- Install Visual Studio Code and add several extensions
- Kick off Docker-Desktop
The script should take about 5 minutes to complete.
> **Note: If you are using your local maching as your development workstation, you can find instructions and scripts here<document link>**


1.  From the Azure Portal, select the resource group you created when you deployed the template in Task 1.

    ![image](media/ns.png)

2.  Select the VM.
   
    ![image](media/ns.png)

3.  Click connect, download the RDP file, and open the RDP file.
    
    ![image](media/ns.png)

4.  Enter the user name and password you used when you deployed the template.

    ![image](media/ns.png)

5.  Once you login, a script will kick off which will install additional tools.

    ![image](media/ns.png)


6.  When the script is finished, it will launch Docker-Desktop and copy a script to your desktop.  The script on your desktop can be used if you need to reinstall some of the tools.

    ![image](media/ns.png)

7.  Click OK for Docker-Desktop.  This will start docker on the development machine.  This will take about 5 minutes.

    ![The Deploying Windows 10 Pro N, Version 1709 icon indicates that deployment has begun to your Azure subscription.](media/b4-image13.png)

### Task 3: Validate your environment

We are going to run a couple of tests to make sure your environment is setup correctly.  We are going to;
- Open Visual Studio Code
- Open a PowerShell Terminal Window
- Verify we can run a docker container
- Verify we have various command line tools installed and running

1. Open Visual Studio Code and verify extensions are installed
2. Open a terminal window and configure PowerShell as your default terminal
3. Test docker by entering 'docker run hello-world' in the terminal window
4. Enter 'az' in the terminal window to verify the azure command line tool
5. Enter 'kubectl' in the terminal window to verify the kubernetes command line tool
6. Enter 'helm' in the terminal window to verify the helm command line tool

### Task 4: Setup your Azure DevOps Account
This task will walk you through creating a new Azure DevOps tennant and creating a project for the lab.

**NOTE: if you already have and use an Azure DevOps tennant, you can skip to step 4d and use it as long as you have the ability to create new projects and build/release pipelines.**

1. go to visualstudio.com
2. login 
3. create new organization
4. create new project
5. upload project files into your repo

### Task 5: Create Azure Resources needed for the lab

The lab uses several Azure services.  In this task we will use the Azure CLI to deploy the services into the resource group you created in step 1.  We will create the following in your Azure subscription;
- Azure Service Principle
- Azure Container Registry
- Azure Kubernetes Cluster
- Azure CosmosDB

1. Open Visual Studio Code and Open a PowerShell terminal window
2. Create an Azure Service Principle
   1.  show account
   2.  list account
   3.  get subscription
   4.  create service principal
3. Create an Azure Container Registry by executing the following command in the terminal window
   '''az acr create --resource-group <resourceGroupName> --name <containerRegistryName> --sku basic

4. Create an Azure Kubernetes Cluster by executing the following command in the terminal window
    '''az aks create --name <clusterName> --resource-group <resourceGroupName> --service-pricncipal <servicePrincipalName>

5. Create an Azure CosmosDB instance by executing the following command in the terminal window









### Task 9: Create a Service Principal

Azure Kubernetes Service requires an Azure Active Directory service principal to interact with Azure APIs. The service principal is needed to dynamically manage resources such as user-defined routes and the Layer 4 Azure Load Balancer. The easiest way to set up the service principal is using the Azure cloud shell.

> **Note: By default, creating a service principal in Azure AD requires account owner permission. You may have trouble creating a service principal if you are not the account owner.**

1.  Open cloud shell by selecting the cloud shell icon in the menu bar.

    ![The cloud shell icon is highlighted on the menu bar.](media/b4-image35.png)

2.  The cloud shell will open in the browser window. Choose "Bash (Linux)" if prompted or use the left-hand dropdown on the shell menu bar to choose "Bash" (as shown).

    ![This is a screenshot of the cloud shell opened in a browser window. Bash was selected.](media/b4-image36.png)

3.  Before completing the steps to create the service principal, you should make sure to set your default subscription correctly. To view your current subscription type:

    ``` bash
    az account show
    ```

    ![In this screenshot of a Bash window, az account show has been typed and run at the command prompt. Some subscription information is visible in the window, and some information is obscured.](media/b4-image37.png)

4.  To list all of your subscriptions, type:

    ``` bash
    az account list
    ```

    ![In this screenshot of a Bash window, az account list has been typed and run at the command prompt. Some subscription information is visible in the window, and some information is obscured.](media/b4-image38.png)

5.  To set your default subscription to something other than the current selection, type the following, replacing {id} with the desired subscription id value:

    ``` bash
    az account set --subscription {id}
    ```

6.  To create a service principal, type the following command, replacing {id} with your subscription identifier, and replacing suffix with your chosen suffix to make the name unique:

    ``` bash
    az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/{id}" --name="Fabmedical-sp-{SUFFIX}"
    ```

7.  The service principal command will produce output like this. Copy this information; you will need it later.

    ![In this screenshot of a Bash window, az ad sp create-for-rbac \--role=\"Contributor\" \--scopes=\"/subscriptions/{id}\" \--name=\"Fabmedical-sp\" has been typed and run at the command prompt. Service principal information is visible in the window, but at this time, we are unable to capture all of the information in the window. Future versions of this course should address this.](media/b4-image39.png)

### Task 10: Create an Azure Kubernetes Service cluster

In this task, you will create your Azure Kubernetes Service cluster. You will use the same SSH key you created previously to connect to this cluster in the next task.

1.  From the Azure Portal, select **+ Create a resource**, **Containers** and select **Kubernetes Service**.

    ![In this screenshot of the Azure portal, + Create a resource is highlighted and labeled 1 on the left side. To the right, Containers is highlighted and labeled 2 under Azure Marketplace. To the right of that, Kubernetes Service is highlighted and labeled 3 under Featured.](media/b4-image40.png)

2.  In the Basics blade provide the information shown in the screenshot that follows:

    > NOTE: You may need to scroll to see all values.

    * **Subscription**: Choose your subscription which you have been using throughout the lab.
    * **Resource group**: Select the resource group you have been using through the lab.
    * **Name**: Enter fabmedical-SUFFIX.
    * **Region**: Choose the same region as the resource group.
    * **Kubernetes version**: 1.9.10.
    * **DNS Prefix**: Enter fabmedical-SUFFIX.

        ![Basics is selected in the Create Azure Kubernetes Service blade, and the values listed above appear in the corresponding boxes in the Basics blade on the right.](media/b4-image41.png)

    * Configure your VM size.

        * Click "Change Size".
        * Search for "D2_v2".
        * Select "D2_v2".

            ![Microsoft Azure](media/b4-image41b.png)

    * Set the Node Count to 2.

        ![Microsoft Azure](media/b4-image41c.png)


3. Select "Next : Authentication"

    * Configure your service principal.
    
        * **Service principal client ID**: Use the service principal “appId” from the previous step.
        * **Service principal client secret**: Use the service principal “password” from the previous step.

            ![Microsoft Azure](media/b4-image41a.png)


4. Select "Next: Networking".
5. Keep the defaults and select "Next: Monitoring".
6. Keep the defaults and select "Next: Tags".
7. Keep the defaults and select "Review + create".
8. You should see that validation passed; select "Create".

9.  On the Summary blade, you should see that validation passed; select **OK**.

    ![Summary is selected in the Create Azure Kubernetes Service blade, and a Validation passed message appears in the Summary blade on the right.](media/b4-image43.png)

10. The Azure Kubernetes Service cluster will begin deployment to your Azure subscription. You should see a successful deployment notification when the cluster is ready. It can take up to 10 minutes before your Azure Kubernetes Service cluster is listed in the Azure Portal. You can proceed to the next step while waiting for this to complete, then return to view the success of the deployment.

    ![This is a screenshot of a deployment notification indicating that the deployments succeeded.](media/b4-image45.png)

> **Note: If you experience errors related to lack of available cores, you may have to delete some other compute resources or request additional cores to your subscription and then try this again.**



### Task 13: Download the FabMedical starter files

FabMedical has provided starter files for you. They have taken a copy of one of their websites, for their customer Contoso Neuro, and refactored it from a single node.js site into a website with a content API that serves up the speakers and sessions. This is a starting point to validate the containerization of their websites. They have asked you to use this to help them complete a POC that validates the development workflow for running the website and API as Docker containers and managing them within the Azure Kubernetes Service environment.

1.  From WSL, download the starter files by typing the following curl instruction (case sensitive):

    ```bash
    curl -L -o FabMedical.tgz http://bit.ly/2uhZseT
    ```

2.  Create a new directory named FabMedical by typing in the following command:

    ```bash
    mkdir FabMedical
    ```

3.  Unpack the archive with the following command. This command will extract the files from the archive to the FabMedical directory you created. The directory is case sensitive when you navigate to it.

    ```bash
    tar -C FabMedical -xzf FabMedical.tgz --strip-components=1
    ```

4.  Navigate to FabMedical folder and list the contents.

    ```bash
    cd FabMedical

    ll
    ```

5.  You'll see the listing includes three folders, one for the web site, another for the content API and one to initialize API data:

    ```bash
    content-api/
    content-init/
    content-web/
    ```

6.  Next log into your VisualStudio.com account.

    If this is your first time logging into this account you will be taken through a first-run experience:

    * Confirm your contact information and select next.
    * Select "Create new account".
    * Enter a fabmedical-SUFFIX for your account name and select Continue.

7.  Create repositories to host the code.

    * Select the icon in the top left corner to return to the account home page.

        ![Home page icon](media/b4-image47.png)
        
    * Select "New Project".
        * Enter fabmedical as the project name.
        * Ensure the Version control is set to Git.
        * Select "Create".
        
    * Once the project creation has completed, select "Code".
    
    * Use the repository dropdown to create a new repository by selecting "+ New repository".
    
        ![Repository dropdown](media/b4-image48.png)
           
    * Enter "content-web" as the repository name.
    
    * Once the project is created click "Generate Git credentials".
    
        ![Generate Git Credentials](media/b4-image50.png)
          
        * Enter a password.
        * Confirm the password.
        * Select "Save Git Credentials".
        
    * Using your WSL window, set your username and email which are used in Azure DevOps for Git Commits.

        ```bash
          git config --global user.email "you@example.com"
          git config --global user.name "Your Name"
        ```
        For example:

        ```bash
            git config --global user.email "you@example.onmicrosoft.com"
            git config --global user.name "you@example.onmicrosoft.com"
        ```
    
    * Using your WSL window, initialize a new git repository.

        ```bash
        cd content-web
        git init
        git add .
        git commit -m "Initial Commit"
        ```
        
    * Setup your VisualStudio.com repository as a new remote for push. You can copy the commands for "**HTTPS**" to do this from your browser.  Edit the HTTPS URL as given below:

       Remove characters between "https://" and "dev.azure.com from" HTTPS URL of the copied commands.
       For example:
       
       ```bash
       From this https URL 
       "git remote add origin https://fabmedical-sol@dev.azure.com/fabmedical-sol/fabmedical/_git/content-web
        git push -u origin --all"

       Remove "fabmedical-sol@" from the above url to make it like below:
       "git remote add origin https://dev.azure.com/fabmedical-sol/fabmedical/_git/content-web
        git push -u origin --all"
       ```
        
         Paste these commands into your WSL window.
        
       * When prompted, enter your VisualStudio.com username and the git credentials password you created earlier in this task.
        
    * Use the repository dropdown to create a second repository called "content-api".
    
        * Using your WSL window, initialize a new git repository in the content-api directory.
        
            ```bash
            cd ../content-api
            git init
            git add .
            git commit -m "Initial Commit"
            ```
            
        * Setup your VisualStudio.com repository as a new remote the push. Use the repository dropdown to switch to the "content-api" repository. You can then copy the commands for the setting up the content-api repository from your browser, then update the HTTPS URL as you did earlier for content-web repository HTTPS url. Paste these commands into your WSL window.
        
        * When prompted, enter your VisualStudio.com username and the git credentials password you created earlier in this task.
        
    * Use the repository drop down to create a third repository called "content-init".
    
        * Using your WSL window, initialize a new git repository in the content-init directory.
        
            ```bash
            cd ../content-init
            git init
            git add .
            git commit -m "Initial Commit"
            ```
        * Setup your VisualStudio.com repository as a new remote the push.  Use the repository drop down to switch to the "content-init" repository. You can then copy the commands for the setting up the content-init repository from your browser, then update the HTTPS URL as you did earlier for other repo's HTTPS url's. Paste these commands into your WSL window.
        
        * When prompted, enter your VisualStudio.com username and the git credentials password you created earlier in this task.

8.  Clone your repositories to the build agent.

    * From WSL, connect to the build agent VM as you did previously in Before the hands-on lab - Task 6: Connect securely to the build agent using the SSH command.

    * In your browser, switch to the "content-web" repository and click "Clone" in the right corner.

        ![This is a screenshot of the content-web repository page with the Clone button indicated.](media/b4-image51.png)

    * Copy the repository url.
        
    * Update the repository url by removing the characters between "https://" and "dev.azure.com".
       
      For example: modify the repository url "https://fabmedical-sol@dev.azure.com/fabmedical-sol/fabmedical/_git/content-web"
      as "https://dev.azure.com/fabmedical-sol/fabmedical/_git/content-web"

    * Use the repository url to clone the content-web code to your build agent machine.

        ```bash
        git clone <REPOSITORY_URL>
        ```

    * In your browser, switch to the "content-api" repository and select "Clone" to see and copy the repository url and update the URL by removing some characters as you did earlier for content-web repository.

    * Use the repository url and `git clone` to copy the content-api code to your build agent.

    * In your browser, switch to the "content-init" repository and select "Clone" to see and copy the repository url and then update the url by removing some characters as you did earlier for other repositories.

    * Use the repository url and `git clone` to copy the content-init code to your build agent.

>**Note: Keep this WSL window open as your build agent SSH connection. You will later open new WSL sessions to other machines.**

You should follow all steps provided *before* performing the Hands-on lab.
