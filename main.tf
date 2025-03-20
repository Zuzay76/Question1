terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "custom_image" {
  name = "your-dockerhub-username/your-image:tag"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx-container"

  ports {
    internal = 80
    external = 8080
  }

  networks_advanced {
    name = "bridge"
    aliases = ["web"]
  }
}