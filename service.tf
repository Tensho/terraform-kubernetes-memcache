resource "kubernetes_service" "memcached" {
  metadata {
    name      = var.set_name
    namespace = var.namespace

    labels = {
      "app.kubernetes.io/name" = var.set_name
      "app.kubernetes.io/part-of" = "memcached"
    }
  }

  spec {
    cluster_ip = "None"

    port {
      name        = "memcached"
      port        = var.memcache_port
      target_port = "memcached"
    }

    port {
      name        = "metrics"
      port        = var.metrics_port
      target_port = "metrics"
    }

    selector = {
      "app.kubernetes.io/name" = var.set_name
      "app.kubernetes.io/part-of" = "memcached"
    }
  }
}

