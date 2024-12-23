resource "datadog_monitor" "DataDog_http_check" {
  include_tags        = false
  require_full_window = false
  monitor_thresholds {
    critical = 1
    ok       = 1
    warning  = 1
  }
  name    = "DataDog http check"
  type    = "service check"
  query   = <<EOT
"http.can_connect".over("*").by("*").last(2).count_by_status()
EOT
  message = "Some issues with the network"
}
