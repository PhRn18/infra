resource "aws_route53_zone" "private_zone" {
  name    = "internal-services.com"
}

resource "aws_route53_record" "db_record" {
  depends_on = [ aws_db_instance.mysql-db ]
  zone_id = aws_route53_zone.private_zone.zone_id
  name    = "db.internal-services.com"
  type    = "A"
  ttl     = 300
  records = [aws_db_instance.mysql-db.address]
}
