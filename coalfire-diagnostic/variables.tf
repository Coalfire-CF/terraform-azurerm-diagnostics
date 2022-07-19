variable "resource_type" {
  description = "The resource type i.e Azure product name (follow CF naming convention)."
  type        = string

  validation {
    condition = contains([
      "acr",      # azure container registry
      "agw",      # application gateway
      "aks",      # azure kubernetes service
      "aa",       # automationaccount
      "avd_pool", # azure virtual desktop hostpool
      "avd_ws",   # azure virtual desktop workspace
      "rsv",      # recovery services vault
      "cdb",      # cosmos db
      "eh",       # event hub
      "func",     # function app
      "fw",       # firewall
      "kv",       # key vault
      "lb",       # load balancer
      "msql",     # mySql db
      "nsg",      # network security group
      "psql",     # postgreSql db
      "rdc",      # azure redis cache
      "sql",      # mssql db
      "sa",       # storage account
      "sub",      # subscription
      "vnet"      # virtual network
      ],
      var.resource_type
    )
    error_message = "The resource type is not currently supported or it is misspelled. Refer to the README for supported resources."
  }
}

variable "resource_id" {
  description = "Target resource ID"
  type        = string
}

variable "diag_log_analytics_id" {
  description = "ID of the Log Analytics Workspace diagnostic logs should be sent to"
  type        = string
}