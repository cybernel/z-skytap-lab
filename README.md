# Skytap & Terraform ZPA Lab Environment

**Intro**

The purpose of these Terraform files is to document and automate the provisioning of a SkyTap environment using SkyTap templated VMs and Terraform files.

To start, we have to enable SkyTap API's: https://help.skytap.com/csh-api-token.html
This is not enabled by default, so you will need to enable an API token for your user account. Please treat this token securely and do not document it in your code. It's reccomended to store your username and API Token as an environment variable on the host you will be running Terraform from. 

For example, these Terraform files use the variable skytapusername & skytaptoken. To set these an ENV on windows that Terraform will read, you can user the following commands (these commands are not persistent and need to be re-entered after a reboot):
    Set-Item -Path env:TF_VAR_skytapusername -Value "ndasilva@zscaler.com"
    Set-Item -Path env:TF_VAR_skytaptoken -Value "ABC1234567890"

To read these ENV you can use these commands to verify:
    Get-Item -Path env:TF_VAR_skytapusername
    Get-Item -Path env:TF_VAR_skytaptoken

**main.tf**

This file starts the skytap provider, authenticates into Skytap and creates an empty environment called "APJ TAG ZPA Environment01 Lab". This name is important as we will reference it in other files. We need to start with an environment by using an empty template and assign it a name Empty Environment Tenplate

**network.tf**

This file creates the skytap networks and attaches them to our environment. Add additional networks using the same syntax.
The default LAN network is called DC_LAN. All below hosts will be dropped into this network.

**windows-server.tf**

Creates a windows server 2022 vm from a template sourced from Skytap. This server has been sysprepped and will have a unique SID.
Please note, if you plan on prompting this server to an AD server, you should uninstall or disable the skytap helper.
The skytaphelper on windows auto synchronizes the VM hostname in Skytap to the actual VM hostname.

**windows-desktop.tf**

Creates a windows 10 desktop vm from a template sourced from Skytap. This desktop has been sysprepped and will have a unique SID.

**windows-app-connector.tf**

Deploys a pair of app connectors.

**windows-branch-connector.tf**

Deploys a pair of branch connectors connectors.

**Common Terraform Commands**

When running multiple terraform files, dependancies are automatically tracked and order for you. You can view the order by using the following command:
`terraform graph`

To see what changes the terraform files will make, run:
`terraform plan`

To create the environment run:
`terraform apply`

The output of these environments are captured for you. this includes the Environment and VM URL's. To view these at anytime, run
`terraform output`

This command will provides shortcut links to the environment and VM's created. You may need these and Skytap will auto shutdown the enviroment after 60mins.

