resource "aws_eks_node_group" "it-amd" {
  cluster_name    = aws_eks_cluster.it.name
  node_group_name = "${var.name}-amd"
  node_role_arn   = aws_iam_role.it-noda.arn
  subnet_ids      = var.subnets_ids

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  ami_type       = "AL2_x86_64"
  instance_types = ["t2.micro"]

  labels = {
    "node-type" : "general"
  }

  depends_on = [
    aws_iam_role_policy_attachment.kubeedge-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.kubeedge-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.kubeedge-node-AmazonEC2ContainerRegistryReadOnly,
  ]
  tags = merge(
    var.tags,
    { Name = "${var.name}-amd-node-group" }
  )
}
