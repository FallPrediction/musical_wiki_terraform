output "app_server_public_ip" {
  description = "Public IP address of App server"
  value       = aws_eip.app_server_ip.public_ip
}