# assume_role_arn = "arn:aws:iam::066346343248:role/assume-id-admin"
# Basic Information
account_alias = "id"
product       = "eks"

# Cluster information
cluster_version = "1.32"
release_version = "1.32.1-20250212"

# Service CIDR
service_ipv4_cidr = "172.20.0.0/16"

# Addon information
# https://docs.aws.amazon.com/eks/latest/userguide/managing-coredns.html
coredns_version = "v1.11.4-eksbuild.2"

# https://docs.aws.amazon.com/eks/latest/userguide/managing-kube-proxy.html
kube_proxy_version = "v1.32.0-eksbuild.2"

# https://docs.aws.amazon.com/eks/latest/userguide/managing-vpc-cni.html
vpc_cni_version = "v1.19.2-eksbuild.1"

# https://github.com/kubernetes-sigs/aws-ebs-csi-driver
deploy_ebs_csi_driver  = false
ebs_csi_driver_version = "v1.39.0-eksbuild.1"

# https://github.com/aws/eks-pod-identity-agent
deploy_pod_identity_agent  = false
pod_identity_agent_version = "v1.3.2-eksbuild.2"

# Node Group configuration
# Node Group configuration
node_group_configurations = [
  {
    name                = "ondemand_default"
    spot_enabled        = false
    release_version     = "1.32.1-20250212"
    disk_size           = 20
    ami_type            = "AL2023_x86_64_STANDARD"
    node_instance_types = ["t3.large"]
    node_min_size       = 2
    node_desired_size   = 2
    node_max_size       = 2
    labels = {
      "cpu_chip" = "intel"
    }
  },
  {
    name                = "spot_default"
    spot_enabled        = true
    disk_size           = 20
    release_version     = "1.32.1-20250212"
    ami_type            = "AL2023_x86_64_STANDARD"
    node_instance_types = ["t3.large"]
    node_min_size       = 2
    node_desired_size   = 2
    node_max_size       = 10
    labels = {
      "cpu_chip" = "intel"
    }
  },
]

additional_security_group_ingress = [
  {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["10.20.0.0/16"]
  }
]

# Specified KMS ARNs accessed by ExternalSecrets
external_secrets_access_kms_arns = [
  "arn:aws:kms:ap-northeast-2:066346343248:key/79e6d15d-a3b1-431a-a6a2-ae9c63c25ddb"
]

# Specified SSM ARNs accessed by ExternalSecrets
external_secrets_access_ssm_arns = [
  "*"
]

# Specified SecretsManager ARNs accessed by ExternalSecrets
external_secrets_access_secretsmanager_arns = [
  "*"
]
