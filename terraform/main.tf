# 1. AWS Virtual Private Cloud:

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "cloudops-vpc"
  }
}

# 2. Subnets:

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-subnet"
  }

}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-subnet"
  }
}

# 3. Internet Gateway:

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "cloudops-internet-gateway"
  }

}

# 4. Public routing.

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# 5. AWS CloudWatch:

resource "aws_cloudwatch_log_group" "main" {
  name              = "/cloudops-iac-lab/logs"
  retention_in_days = 7 # logs older than 7 days are automatically deleted.

}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "cloudops-iac-lab-dashboard"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "text"
        x      = 0
        y      = 0
        width  = 12
        height = 4

        properties = {
          markdown = <<-EOT
              # CloudOps IaC Lab

              AWS networking foundation managed with Terraform.

              Resources:
              - VPC
              - Public subnet
              - Private subnet
              - Internet Gateway
              - Route tables
              - CloudWatch Log Group
            EOT
        }
      }
    ]
  })
}