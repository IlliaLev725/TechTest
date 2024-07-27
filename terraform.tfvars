# AWS account config
region = "eu-central-1"

# General for all infrastructure
# This is the name prefix for all infra components
name = "illia-tech"


vpc_id      = "vpc-0727f625609847be9"
subnets_ids = ["subnet-01bce21ab6d660547", "subnet-0c0c5957e353ef80d", "subnet-0ccea9df86e8fd668"]

tags = {
  Environment = "test"
  TfControl   = "true"
}

