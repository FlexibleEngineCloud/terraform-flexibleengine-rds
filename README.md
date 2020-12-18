# Flexible Engine RDS Terraform Module	

Terraform module which creates RDS on Flexible Engine.	
Available datastore are:	

* PostgreSQL	
* MySQL	
* SQLServer	

More details about supported version in followed link https://registry.terraform.io/providers/FlexibleEngineCloud/flexibleengine/latest/docs/resources/rds_instance_v3	


## TF version : 0.13	

## Usage : Terraform	

```hcl	
module "rds" {	
  source = "FlexibleEngineCloud/rds/flexibleengine"	
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
|------|-------------|------|---------|:--------:|
| db\_backup\_keepdays | keep days of database backup | `number` | `3` | no |
| db\_backup\_starttime | start time of database backup (Exemple : 08:00-09:00) | `string` | `"01:00-02:00"` | no |
| db\_flavor | Flavor of database. Check Terraform and FE documentation to get flavor list | `string` | `""` | no |
| db\_root\_password | root password of RDS | `string` | `""` | no |
| secgroup_id | Security group id to use for RDS | `string` | `""` | no |
| db\_tcp\_port | TCP port of database | `string` | `""` | no |
| db\_type | Type of database. Can be MySQL, PostgreSQL, SQLServer | `string` | `""` | no |
| db\_version | Version of database. Check Terraform and FE documentation to get version list | `string` | `""` | no |
| rds\_ha\_enable | To enable HA of RDS | `bool` | `false` | no |
| rds\_ha\_replicamode | To enable HA of RDS | `string` | `""` | no |
| rds\_instance\_az | Availability zones of RDS instance (Multiple AZ must be specified if you are using HA) | `list(string)` | <pre>[<br>  "eu-west-0a"<br>]</pre> | no |
| rds\_instance\_name | name of RDS instances | `string` | `""` | no |
| rds\_instance\_volume\_encryption\_id | KMS Key id for encryption | `string` | `null` | no |
| rds\_instance\_volume\_size | Volume size of instances | `number` | `0` | no |
| rds\_instance\_volume\_type | Volume type of instances | `string` | `"COMMON"` | no |
| rds\_param\_group\_id | Parameters Group ID | `string` | `null` | no |
| rds\_read\_replicat\_list | n/a | <pre>list(object({<br>    name               = string<br>    flavor             = string<br>    availability_zone  = string<br>    volume_type        = string<br>    disk_encryption_id = string<br>  }))</pre> | n/a | yes |
| subnet\_id | ID of the subnet | `string` | `""` | no |
| vpc\_id | ID of the VPC | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Instance id |
| nodes | List of RDS nodes |
| private\_ips | Private IP address list of nodes |
| public\_ips | Public IP address list of nodes |

