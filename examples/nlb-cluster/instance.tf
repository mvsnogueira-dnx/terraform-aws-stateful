module "nlb_cluster" {
  source             = "./modules/terraform-aws-stateful/"
  name               = local.workspace["name"]
  cluster_name       = local.workspace["cluster_name"]
  instance_type      = local.workspace["instance_type"]
  instance_count     = local.workspace["instance_count"]
  custom_efs_dir     = local.workspace["custom_efs_dir"]
  hostnames          = local.workspace["hostnames"]
  hosted_zone        = local.workspace["hosted_zone"]
  lb_type            = local.workspace["lb_type"]
  lb_port            = local.workspace["lb_port"]
  lb_protocol        = local.workspace["lb_protocol"]
  sg_cidr_blocks     = local.workspace["sg_cidr_blocks"]
  hostname_create    = true
  vpc_id             = data.aws_vpc.selected.id
  instances_subnet   = data.aws_subnet_ids.private.ids
  secure_subnet_ids  = data.aws_subnet_ids.secure.ids
  public_subnet_ids  = data.aws_subnet_ids.public.ids
}