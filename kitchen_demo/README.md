# Chef Test Kitchen Demo
## Introduction:
Expecting the readers should have basic understanding Chef cookbooks and related development experience.
### Target audience for this demo,
1. Chef developers or teams looking to implement Chef in-spec script
2. Developers/testers looking to implement Chef Test Kitchen in real-time using Google Compute Engine VM.

## Objective:
1. Cookbook in this repo, does create a file and a directory in /tmp path.
2. It has inspec test cases to verify the cookbook functionality.
3. The inspec test will be run inside a Google Compute Engine VM, triggered via Chef Test Kitchen.

## Pre-Requisites:
1. Google Cloud Account
2. Billing enabled Google Cloud Project. Refer [Google Cloud Docs](https://cloud.google.com/billing/docs/how-to/manage-billing-account)

## Steps to execute the DEMO.
1. Checkout cookbooks repo
2. Install [ChefDK](https://downloads.chef.io/chefdk/) & [Google Cloud SDK](https://cloud.google.com/sdk/install) according to your system OS.
3. Modify the project name in kitchen.yml file
4. run the gcloud auth application-default login command which will create the credentials file for you.
5. Execute command: `gcloud auth application-default login`
6. Screen will prompt you for entering verification code
7. Follow the instructions and copy the verification code showed on the screen and copy in the command prompt
8. This will create application_default_credentials.json in `USER_HOME/.config/global/application_default_credentials.json`
9. The same credential json can be used for sub-sequent usage of same google cloud account in Chef kitchen
10. Create ssh public key for the user_name. It creates the key in USER_HOME/.ssh path
11. Upload the ssh public key to Google compute metadata. Either thru google cloud console or Gcloud SDK or API
Instructions found here: https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys#addkey
12. Now the cookbook is ready to run the following chef kitchen commands
    - Unit test command: `chef exec rspec spec/`
    - Linting and syntax check: `chef exec cookstyle`
    - Create test vm : `chef exec kitchen create`
    - Execute cookbook in test vm: `chef exec kitchen converge`
    - Run the inspec test cases in test vm: `chef exec kitchen verify`
    - Cleanup the test vm to save costs:  `chef exec kitchen destroy`

