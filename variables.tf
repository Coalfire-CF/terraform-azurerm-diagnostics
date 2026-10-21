variable "resource_type" {
  description = "Short code for the target resource type. Each code maps to one or more diagnostic settings; see the README for the list."
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
      "rdedb",    # redis enterprise database
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
  description = "ID of the target resource. Pass the resource's id attribute, not a hand-built string. For \"sa\" pass the storage account ID; the module also targets its blob, queue, table and file services. For \"mssql\" pass the server ID; the module also targets its master database. For \"sub\" pass /subscriptions/<id>."
  type        = string
}

variable "diag_log_analytics_id" {
  description = "ID of the Log Analytics Workspace diagnostic logs should be sent to"
  type        = string
}
