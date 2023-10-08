# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:   

This project is going to utilise semantic versioning for its tagging.
[semver.org](https://semver.org/)

The general format:

**MAJOR.MINOR.PATCH**, eg. '1.0.1'

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

### Considerations with the Terraform CLI changes

The Terraform CLI installation instructions have changed due to gpg keyring changes. So we neede to refer to the latest install CLI instructions via Terraform Documentation and change the scripting for installation.

[Install Terraform CLI ](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) 

### Considerations for Linux Distributions

This project is built against Unbuntu.
Please consider checking your Linux Distribution and change accordingly to your distribution needs.

### Refractoring into Bash scripts

While fixing the Terraform CLI gpg deprecation issues we noticed that the bash scripts were a considerable amount more code. So we decided to create a bash script for Terraform CLI.

This bash script is located here:[ ./bin/install_terraform_cli](./bin/install_terraform_cli.sh)

- This will keep the Gitpod task file ([.gitpod.yml](.gitpod.yml)) tidy.
- This allow as an easier to debug and execute manually Terraform CLI install.
- This allows better portability for other projects that needs to install Terraform CLI.


[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

[How To Check OS Version in Linux ](
https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example for checking OS Version

'''
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
'''

#### Shebang Considerations

A Shebang(pronounce Sha-bang) tells the bash script what program will interpret the script. eg. #!/bin/sh

ChatGPT recommended this format for bash: '#!/bin/sh env bash'

- for portability for different OS distributions
- will search the users PATH for the bash executable

https://en.wikipedia.org/wiki/Shebang_(Unix)

#### Execution Considerations

When executing the bash script we can use the './bin' shorthand notation to execute the bash script.

eg. './bin/install_terrafrom_cli'

If we are using a script in gitpod.yml we need to point the script to a program to interpret it.

eg. 'source ./bin/install_terraform_cli'

### Linux Considerations

Linux permissions works as follows:

In order to make our bash scripts executable we need to change linux permission for the file to be executable at the user mode.

'''sh
chmod u+x ./bin/install_terraform_cli
'''

Alternatively:

'''sh
chmod 744 ./bin/install_terraform_cli
'''

https://en.wikipedia.org/wiki/Chmod

### Github Lifecycle (Before, Init, Command)

We need to be careful when using Init because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/workspace-lifecycle

### Working Env Vars

#### env command

We can list out all Environment variables (Env Vars) using the 'env' command.

We can filter specific env vars using grep eg. 'env | grep AWS_'

#### Setting and Unsetting Env Vars

In the terminal we can set using 'export HELLO='world'

In the terminal we unset using 'unset HELLO'

We can set an env var temporarily when just running a command

'''sh
HELLO='world' ./bin/print_message
'''

Within a bash script we can set env without writing export eg.

HELLO='world'

'''sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
'''

#### Printing Vars

We can print an env var using echo eg. 'echo $HELLO'

#### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want Env Vars to persist across all future bash terminal that are open then you need to set env vars in your bash profile. eg. 'bash_profile'

#### Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage. 

'''
gp env HELLO='world'
'''

All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.

You can also set en vars in the '.gitpod.yml' but this can only contain non-sensitive env vars.



