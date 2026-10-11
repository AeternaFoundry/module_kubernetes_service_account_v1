variable "service_account_v1s" {
  description = <<EOT
Map of service_account_v1s, attributes below
Required:
    - metadata (block):
        - annotations (optional)
        - generate_name (optional)
        - labels (optional)
        - name (optional)
        - namespace (optional)
Optional:
    - automount_service_account_token
    - image_pull_secret (block):
        - name (optional)
    - secret (block):
        - name (optional)
    - timeouts (block):
        - create (optional)
EOT

  type = map(object({
    automount_service_account_token = optional(bool)
    metadata = object({
      annotations   = optional(map(string))
      generate_name = optional(string)
      labels        = optional(map(string))
      name          = optional(string)
      namespace     = optional(string)
    })
    image_pull_secret = optional(list(object({
      name = optional(string)
    })))
    secret = optional(list(object({
      name = optional(string)
    })))
    timeouts = optional(object({
      create = optional(string)
    }))
  }))
}

