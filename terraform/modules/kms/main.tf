resource "aws_kms_key" "kms" {
  multi_region = true
  deletion_window_in_days = var.deletion_window_in_days
}
resource "aws_kms_alias" "kms-alias" {
  name = "alias/${var.kms_name}"
  target_key_id = aws_kms_key.kms.id
}
resource "aws_kms_replica_key" "key-replica" {
  deletion_window_in_days = var.deletion_window_in_days
  primary_key_arn = aws_kms_key.kms.arn
  provider = aws.secondary_region
}
resource "aws_kms_alias" "kms-replica-alias" {
  name = "alias/${var.kms_name}"

  target_key_id = aws_kms_replica_key.key-replica.id
  provider = aws.secondary_region
}