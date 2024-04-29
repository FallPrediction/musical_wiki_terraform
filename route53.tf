resource "aws_route53_zone" "fall-prediction" {
  name          = "fall-prediction.net"
  force_destroy = true
}

resource "aws_route53_record" "fall-prediction" {
  allow_overwrite = true
  name            = "fall-prediction.net"
  ttl             = 172800
  type            = "NS"
  zone_id         = aws_route53_zone.fall-prediction.zone_id

  records = [
    aws_route53_zone.fall-prediction.name_servers[0],
    aws_route53_zone.fall-prediction.name_servers[1],
    aws_route53_zone.fall-prediction.name_servers[2],
    aws_route53_zone.fall-prediction.name_servers[3],
  ]
}

resource "aws_route53_record" "musical_wiki" {
  zone_id = aws_route53_zone.fall-prediction.zone_id
  name    = "musical_wiki.fall-prediction.net"
  type    = "A"
  ttl     = 300
  records = [aws_eip.app_server_ip.public_ip]
}
