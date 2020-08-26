module "test_rds" {
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

}