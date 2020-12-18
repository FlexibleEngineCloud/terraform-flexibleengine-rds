module "rds_sg" {
  source  = "FlexibleEngineCloud/secgroup/flexibleengine"
  version = "2.0.1"

  name        = "mysql-rds-test"
  description = "Security group for CCE MySQL RDS"

  ingress_with_source_cidr = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      ethertype   = "IPv4"
      source_cidr = "10.2.0.0/16"
    }
  ]
}

resource "flexibleengine_rds_parametergroup_v3" "rds_parametergroup" {
  name        = "mysql-rds-test-pg"
  description = "Set time_zone parameter of RDS"
  values = {
    time_zone              = "Europe/Paris"
    lower_case_table_names = "0"
  }
  datastore {
    type    = "mysql"
    version = "5.6"
  }
}

module "rds" {
  source  = "terraform-flexibleengine-modules/rds/flexibleengine"
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

  rds_ha_enable      = false
  rds_ha_replicamode = "async"

  rds_instance_name        = "rds_mysql_foo"
  rds_instance_volume_type = "COMMON"
  rds_instance_volume_size = 100
  rds_instance_az          = ["eu-west-0a"]

  rds_param_group_id = flexibleengine_rds_parametergroup_v3.rds_parametergroup.id

  depends_on = [module.rds_sg, flexibleengine_rds_parametergroup_v3.rds_parametergroup]

}