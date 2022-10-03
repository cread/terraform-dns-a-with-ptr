# DNS A Record with PTR

This repo contains a simple module that creates corresponding DNS Pointer (`PTR`) records when creating Address (`A`) records.

## How to use this module

```hcl
provider "dns" {
  update {
    <Configure your provider here>
  }
}

module "dns_a_with_ptr" {
  source     = "git@github.com:cread/terraform-dns-a-with-ptr.git?ref=1.0.0"
  zone       = "example.com."
  name       = "newhost"
  addresses  = ["192.168.1.1"]
  rev_octets = 3
}
```

## License

This code is released under the GNU GENERAL PUBLIC LICENSE Version 3 (GPLv3). Please see [LICENSE](LICENSE) for more details
