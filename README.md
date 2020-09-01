## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| flexibleengine | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| db\_backup\_keepdays | keep days of database backup | `number` | `3` | no |
| db\_backup\_starttime | start time of database backup (Exemple : 08:00-09:00) | `string` | `"01:00-02:00"` | no |
| db\_flavor | Flavor of database. Check Terraform and FE documentation to get flavor list | `string` | `""` | no |
| db\_root\_password | root password of RDS | `string` | `""` | no |
| db\_sg | name of RDS security group to create | `string` | `""` | no |
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
| rds\_read\_replicat\_list | n/a | <pre>list(object({<br>    name               = string<br>    flavor             = string<br>    availability_zone  = string<br>    volume_type        = string<br>    disk_encryption_id = string<br>  }))</pre> | n/a | yes |
| subnet\_name | Name of the data subnet | `string` | `""` | no |
| vpc\_name | Name of the VPC | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Instance id |
| nodes | List of RDS nodes |
| private\_ips | Private IP address list of nodes |
| public\_ips | Public IP address list of nodes |

