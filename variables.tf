variable "resource_type" {
  description = "The resource type i.e Azure product name (follow CF naming convention)."
  type        = string

  validation {
    condition = contains([
      "acr",      # azure container registry
      "agw",      # application gateway
      "aks",      # azure kubernetes service
      "aa",       # automation account
      "asp",      # app service
      "ase",      # app service environment
      "avd_pool", # azure virtual desktop hostpool
      "avd_ws",   # azure virtual desktop workspace
      "cdb",      # cosmos db
      "df",       # data factory
      "dbk",      # databricks
      "rsv",      # recovery services vault
      "eh",       # event hub
      "func",     # function app
      "fw",       # firewall
      "kv",       # key vault
      "kusto",    # kusto
      "law",      # log analytics workspace
      "lb",       # load balancer
      "lga",      # logic app
      "msql",     # mySql db
      "mssql",    # mssql server
      "mssql_ep", # SQL Elastic Pool
      "mssqldb",  # mssql db
      "nsg",      # network security group
      "psql",     # postgreSql flexible db
      "rdc",      # azure redis cache
      "rdec",     # redis enterprise cluster
      "sql",      # sql db
      "sa",       # storage account
      "sub",      # subscription
      "vnet",     # virtual network
      "webapp"    # Web App
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
