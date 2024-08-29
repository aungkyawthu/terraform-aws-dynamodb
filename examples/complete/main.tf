######################################################################################################
# © 2024 Amazon Web Services, Inc. or its affiliates. All Rights Reserved.
# This AWS Content is provided subject to the terms of the AWS Customer Agreement available at
# http://aws.amazon.com/agreement or other written agreement between Customer and either
# Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.
#######################################################################################################

module "dynamodb_table_01" {
  source = "../.."
  # source = "git::git@ssh.dev.azure.com:v3/petronasvsts/PETRONAS_AWS_IAC_Module/terraform-aws-dynamodb?ref=v5.0-latest"

  create_table        = var.create_table
  autoscaling_enabled = var.autoscaling_enabled
  name                = var.name
  hash_key            = var.hash_key
  range_key           = var.range_key
  billing_mode        = var.billing_mode
  read_capacity       = var.read_capacity
  write_capacity      = var.write_capacity
  stream_enabled   = var.stream_enabled
  stream_view_type = var.stream_view_type
  table_class      = var.table_class

  autoscaling_read = {
    scale_in_cooldown  = 10
    scale_out_cooldown = 100
    target_value       = 80
    min_capacity       = 10
    max_capacity       = 100
  }

  autoscaling_write = var.autoscaling_write

  attributes = var.attributes
}
