# RDS Instance with MySQL 5.6.35 and Parameter Group

Create a single RDS instance MySQL 5.6.35 with a parameter group that sets the Time Zone to Eurpope/Paris and the Lower Case condition to "0".

# Usage

Fill the parameters in the main.tf and provider.tf files, and run the Terraform commands:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```