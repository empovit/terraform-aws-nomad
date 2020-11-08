job "param-example" {

  region = "us-west-2"
  datacenters = ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d", "us-west-2e"]

  type = "batch"

  parameterized {
    payload       = "forbidden"
  }

  group "sleep" {
    count = 1
    restart {
      attempts = 0
    }

    ephemeral_disk {
      size = 300
    }

    task "sleep" {
      driver = "exec"
      config {
        command = "/bin/sleep"
        args    = ["120"]
      }

      resources {
        cpu    = 500 # 500 MHz
        memory = 256 # 256MB
        network {
          mbits = 10
        }
      }
    }
  }
}