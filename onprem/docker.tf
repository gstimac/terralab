provider "docker" {
  host = var.docker_host
}

# Create a container
resource "docker_container" "jenkins_lts" {
  image = docker_image.jenkins.latest
  name  = "jenkins_lts"
  publish_all_ports = true

}

resource "docker_image" "jenkins" {
  name = "jenkins/jenkins:lts"
}