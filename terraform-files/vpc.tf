module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "capstone-vpc-sneh"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  public_subnets  = ["10.0.18.0/24", "10.0.19.0/24"]
  private_subnets = ["10.0.25.0/24", "10.0.26.0/24"]

  enable_nat_gateway = true

  tags = {
    "kubernetes.io/cluster/my-eks-201" = "owned"
    "Owner" = "Sneh Dalal"
    "Terraform" = "true"
  }

  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
    "Type" = "Devops Project Public Subnets"
  }

  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
    "Type" = "Devops Project Private Subnets"
  }
}
