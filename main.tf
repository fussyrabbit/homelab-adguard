module "adguard" {
  source            = "git::https://github.com/fussyrabbit/terraform-adguard.git?ref=v1.0.0"
  rate_limit        = 0
  querylog_interval = 90
  stats_interval    = 90

  upstream_dns = [
    "tls://one.one.one.one",
    "https://dns.cloudflare.com/dns-query"
  ]

  bootstrap_dns = [
    "217.10.44.35",
    "217.10.36.5"
  ]

  static_leases = [
    {
      hostname = "pve-01"
      ip       = "192.168.100.142"
      mac      = "00:e0:1f:c6:66:e5"
    },
    {
      hostname = "yandex-mini2-wh2b"
      ip       = "192.168.100.238"
      mac      = "b8:87:6e:b5:1e:4f"
    }
  ]

  allowed_clients = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]

  dhcp_enabled   = true
  dhcp_interface = "eth0"
  dhcp_settings = {
    gateway_ip     = "192.168.100.1"
    subnet_mask    = "255.255.255.0"
    range_start    = "192.168.100.200"
    range_end      = "192.168.100.254"
    lease_duration = 3600
  }
  anonymize_client_ip = false
}

