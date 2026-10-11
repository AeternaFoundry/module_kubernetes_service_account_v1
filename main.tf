resource "kubernetes_service_account_v1" "service_account_v1s" {
  for_each = var.service_account_v1s

  automount_service_account_token = each.value.automount_service_account_token

  metadata {
    annotations   = each.value.metadata.annotations
    generate_name = each.value.metadata.generate_name
    labels        = each.value.metadata.labels
    name          = each.value.metadata.name
    namespace     = each.value.metadata.namespace
  }

  dynamic "image_pull_secret" {
    for_each = each.value.image_pull_secret != null ? each.value.image_pull_secret : []
    content {
      name = image_pull_secret.value.name
    }
  }

  dynamic "secret" {
    for_each = each.value.secret != null ? each.value.secret : []
    content {
      name = secret.value.name
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
    }
  }
}

