# Introduction to Terraform with the FireHydrant Provider

## What is Terraform?

Terraform is an infrastructure-as-code provisioning tool comprised of the Terraform language and the Terraform CLI. It lets you treat all parts of operations like software - defining, creating, updating, and destroying your infrastructure with code. 
   * Written in Go
   * Language is declarative, meaning your configurations describe your desired end state, not the steps necessary to get there. Terraform handles the underlying logic of figuring out how to get to the end state by creating a graph of resource dependencies and using that to determine the correct order to make changes. 
   * Terraform generally takes an immutable infrastructure approach, meaning once something is created, it doesn't get changed. Any changes needed are generally made by destroying the existing resource and recreating it with the desired configuration. 

## Why use Terraform?
* Allows you to automate your provisioning workflows. This allows for less human errors, speeds up how long it takes to provision new infrastructure, and makes things more consistent. 
* Defines infrastruture in human-readable configuration files that can be put in version control. Once in version control, you can run tests, do code reviews, and track changes over time. 
* Enables reused through composable modules.
* Supports encoding security and other standards as code so you can have consistently applied policies across all of your infrastruture.

## The Core Terraform Workflow Using the FireHydrant Provider
* Write
   1. Make sure you have Terraform installed.
   1. Make sure Terraform is working by running `terraform -version`. You can see other commands avaialble with `terraform -help`
   1. Clone this repository and navigate into the `firehydrant-configuration` directory. You should see 3 files in this directory: main.tf, variables.tf, and outputs.tf.
   1. Generate a bot token for yourself in FireHydrant and export it to the environment variable TF_VAR_firehydrant_api_key
      ```
      export TF_VAR_firehydrant_api_key=YOUR_BOT_TOKEN_HERE
      ```
   1. Export a unique prefix to the environment variable TF_VAR_resource_prefix (ideally something like your name, with only alphanumeric characters)
      ```
      export TF_VAR_resource_prefix=YOUR_CHOSEN_PREFIX_HERE
      ```
      This will help make sure the resources you create don't conflict with anyone else's.
   1. Get the IDs for `data-source-service`, `data-source-functionality`, and `data-source-environment` fron the FireHydrant UI and add them to your main.tf file under the `Data Sources` section.
   1. Run `terraform init` to download any necessary providers needed to work with your configuration.
   1. Run `terraform fmt` to automatically format your configuration with the standard Terraform style.
   1. Run `terraform validate` to check whether your current configuration is valid.
* Plan
   1. Run `terraform plan`. This will show a preview of everything that will be created if your run `terraform apply` with your current configuration.
* Apply
   1. Run `terraform apply`. This will generate another plan and ask for your approval before creating anything. Type 'yes' and then look in the FireHydrant UI to see your applied changes.
   1. Update your configuration by changing the attributes of a few resources. Save your changes.
   1. Run `terraform apply` again. This will generate another plan and ask for your approval before changing anything. Type 'yes' and then look in the FireHydrant UI to see your applied changes.
   1. Run `terraform destroy`. This will generate another plan and ask for your approval before destroying anything. Type 'yes' and then look in the FireHydrant UI to see that everything .

## Learning Resources
1. [Intro to Terraform documentation](https://www.terraform.io/intro)
1. [Intro to Terraform CLI tutorial](https://learn.hashicorp.com/tutorials/terraform/init?in=terraform/cli)
1. [HashiCorp Learn](https://learn.hashicorp.com/terraform)
1. [Terraform CLI documentation](https://www.terraform.io/cli)
1. [Terraform Language documentation](https://www.terraform.io/language)
1. [FireHydrant Terraform provider documentation](https://registry.terraform.io/providers/firehydrant/firehydrant/latest/docs)
1. [FireHydrant Terraform provider repository](https://github.com/firehydrant/terraform-provider-firehydrant)
