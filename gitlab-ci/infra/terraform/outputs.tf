output "inventory" {
value = <<INVENTORY
{ "_meta": {
        "hostvars": {
    %{ for index, name in yandex_compute_instance.gitlab-ci-vm[*].name ~}
           "${name}": {
             "host_name": "${yandex_compute_instance.gitlab-ci-vm[index].name}",
             "host_ext_ip": "${yandex_compute_instance.gitlab-ci-vm[index].network_interface.0.nat_ip_address}", 
             "ansible_host": "${yandex_compute_instance.gitlab-ci-vm[index].network_interface.0.nat_ip_address}" 
           },  
    %{ endfor ~}
           "dummy": { } 
        }
    
    },
  "gitlab-ci-vm": { 
    "hosts": [
       "${join("\",\"", yandex_compute_instance.gitlab-ci-vm.*.name)}"
              ]
  }
}
    INVENTORY
}
