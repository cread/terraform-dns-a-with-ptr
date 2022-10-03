variable "ttl" {
  type        = number
  default     = 3600
  description = "DNS TTL value for all records managed by this module"
}

variable "rev_octets" {
  type        = number
  default     = 2
  description = "How many octets for the reverse zone. `rev_octests=3` for `172.17.18.10` would use `18.17.172.in-addr.arpa.` as the reverse zone"

  validation {
    condition     = var.rev_octets <= 3 && var.rev_octets >= 1
    error_message = "The rev_octets value must be between 1 and 3."
  }
}

variable "zone" {
  type        = string
  description = "DNS zone the record set belongs to. It must be an FQDN, that is, include the trailing dot."

  validation {
    condition     = length(split(".", var.zone)) >= 1 && substr(strrev(var.zone), 0, 1) == "."
    error_message = "The zone value must end with a trailing dot."
  }
}

variable "name" {
  type        = string
  description = "The name of the A record. The zone will be appended to this to create the full record"
}

variable "addresses" {
  type        = list(string)
  description = "List of IP address(es) for this record"
}

