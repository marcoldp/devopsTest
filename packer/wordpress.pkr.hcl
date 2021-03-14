variable image-tag{
    type = list(string)
    default = ["latest"]
}

source "docker" "wordpress" {
  image = "wordpress:latest"
  commit = true 
  #run_command= ["-d", "-i", "-t", "--entrypoint=docker-entrypoint.sh", "--", "{{.Image}}"] 
  # by default ["-d", "-i", "-t", "--entrypoint=/bin/sh", "--", "{{.Image}}"]
  # to have same entrypoint as default of wordpress https://github.com/docker-library/wordpress/blob/618490d4bdff6c5774b84b717979bfe3d6ba8ad1/apache/Dockerfile#L5-L9
}

# a build block invokes sources and runs provisioning steps on them.
build {
  sources = ["source.docker.wordpress"]

  provisioner "shell" {
    script = "../ansible/install-ansible.sh"
  }

  provisioner "ansible" {
    playbook_file = "../ansible/playbook.yaml"
  }
  post-processors{
    post-processor "docker-tag"{
      repository="marcoldp/wordpress-test"
      tags=var.image-tag
    }
    //post-processor "docker-push"{}
  }
}


