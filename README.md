# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:   

This project is going to utilise semantic versioning for its tagging.
[semver.org](https://semver.org/)

The general format:

**MAJOR.MINOR.PATCH**, eg. '1.0.1'

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install Terraform CLI

### Considerations with the Terraform CLI changes

The Terraform CLI installation instructions have changed due to gpg keyring changes. So we neede to refer to the latest install CLI instructions via Terraform Documentation and change the scripting for installation.

### Refractoring into Bash scripts


[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/
https://en.wikipedia.org/wiki/Shebang_(Unix)
https://en.wikipedia.org/wiki/Chmod
https://www.gitpod.io/docs/configure/workspaces/workspace-lifecycle
