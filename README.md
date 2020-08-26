# Flexible Engine RDS Terraform Module

Terraform module which creates RDS on Flexible Engine.
Available datastore are:

* PostgreSQL
* MySQL
* SQLServer

More details about supported version in followed link https://www.terraform.io/docs/providers/flexibleengine/d/rds_flavors_v1.html


## TF version : 0.13

## Usage : Terraform

```hcl
module "rds" {
  source = "terraform-flexibleengine-modules/rds/flexibleengine"
  version = "1.0.0"

  vpc_name    = "vpc-main"
  subnet_name = "subnet-cce"

  db_type             = "MySQL"
  db_version          = "5.6.35"
  db_flavor           = "rds.mysql.s1.medium"
  db_sg               = "sg-test-rds"
  db_tcp_port         = "8635"
  db_backup_starttime = "08:00-09:00"
  db_backup_keepdays  = 4
  db_root_password    = "FooBarPasswd1234!"

  rds_ha_enable       = false
  rds_ha_replicamode  = "async"

  rds_instance_name        = "rds_mysql_foo"
  rds_instance_volume_type = "COMMON"
  rds_instance_volume_size = 100
  rds_instance_az          = ["eu-west-0a"]
}
```

## Usage : Terragrunt

```hcl
################################
### Terragrunt Configuration ###
################################

terraform {
  source = "terraform-flexibleengine-modules/rds/flexibleengine"
  version = "1.0.0"
}

include {
  path = find_in_parent_folders()
}

##################
### Parameters ###
##################

inputs = {
    vpc_name    = "vpc-main"
    subnet_name = "subnet-cce"

    db_type             = "MySQL"
    db_version          = "5.6.35"
    db_flavor           = "rds.mysql.s1.medium"
    db_sg               = "sg-test-rds"
    db_tcp_port         = "8635"
    db_backup_starttime = "08:00-09:00"
    db_backup_keepdays  = 4
    db_root_password    = "FooBarPasswd1234!"

    rds_ha_enable       = false
    rds_ha_replicamode  = "async"

    rds_instance_name        = "rds_mysql_foo"
    rds_instance_volume_type = "COMMON"
    rds_instance_volume_size = 100
    rds_instance_az          = ["eu-west-0a"]
}

```

## Databases HA flavor

If you are using an RDS in HA mode, you must add ".ha" to your flavor. 

Exemple : if you are using the flavor rds.mysql.s1.medium, the HA flavor is rds.mysql.s1.medium.ha

Refer to [the FE RDS Documentation](https://docs.prod-cloud-ocb.orange-business.com/usermanual/rds/en-us_topic_dashboard.html)

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| db\_backup\_keepdays | keep days of database backup | string | `0` | no |
| db\_backup\_starttime | Range of start time of database backup (Exemple : 08:00-09:00) | string | `` | no |
| db\_flavor | Flavor of database. Check Terraform and FE documentation to get flavor list | string | `` | yes |
| db\_root\_password | root password of RDS | string | `` | yes |
| db\_sg | name of RDS security group | string | `` | yes |
| db\_tcp\_port | TCP port of database | string | `` | yes |
| db\_type | Type of database. Can be MySQL, PostgreSQL, SQLServer | string | `` | yes |
| db\_version | Version of database. Check Terraform and FE documentation to get version list | string | `` | yes |
| rds\_ha\_enable | To enable HA of RDS | string | `false` | no |
| rds\_ha\_replicamode | To enable HA of RDS | string | `` | no |
| rds\_instance\_az | Availability zones of RDS instance (Multiple AZ must be specified if you are using HA) | list(string) | `[eu-west-0a]` | no |
| rds\_instance\_name | name of RDS instances | string | `` | yes |
| rds\_instance\_volume\_size | Volume size of instances | string | `0` | yes |
| rds\_instance\_volume\_type | Volume type of instances | string | `COMMON` | no |
| subnet\_name | Name of the data subnet | string | `` | yes |
| vpc\_name | Name of the VPC | string | `` | yes |
## Outputs

| Name | Description |
|------|-------------|
| nodes | List of RDS nodes |
| private_ips | Private IP address list of nodes |
| public_ips | Public IP address list of nodes |
