resource "dns_a_record_set" "a" {
  zone      = var.zone
  name      = var.name
  addresses = var.addresses
  ttl       = var.ttl
}

resource "dns_ptr_record" "ptr" {
  for_each = toset(var.addresses)
  name     = join(".", slice(reverse(split(".", each.key)), 0, 4 - var.rev_octets))
  zone     = format("%s.in-addr.arpa.", join(".", reverse(slice(split(".", each.key), 0, var.rev_octets))))
  ptr      = "${var.name}.${var.zone}"
  ttl      = var.ttl
}
