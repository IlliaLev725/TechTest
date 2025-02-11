resource "aws_eks_cluster" "it" {
  name     = var.name
  role_arn = aws_iam_role.cluster.arn

  vpc_config {
    security_group_ids = [aws_security_group.it-cluster.id]
    subnet_ids         = var.subnets_ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.kubeedge-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.kubeedge-cluster-AmazonEKSVPCResourceController,
  ]
  tags = merge(
    var.tags,
    { Name = "${var.name}" }
  )
}

data "aws_eks_cluster_auth" "it" {
  name = aws_eks_cluster.it.name
}

resource "aws_eks_addon" "coredns" {
  cluster_name                = var.name
  addon_name                  = "coredns"
  addon_version               = "v1.11.1-eksbuild.4"
  resolve_conflicts_on_create = "OVERWRITE"

  depends_on = [aws_eks_node_group.it-amd]
}
