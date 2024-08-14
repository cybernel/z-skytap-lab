# Create a new vm APJ https://cloud.skytap.com/vms/102278680
# from this template APJ https://cloud.skytap.com/templates/2214275
resource "skytap_vm" "z-branch-c-01" {
  template_id = 2214275
  vm_id = 102278680
  environment_id = "${skytap_environment.Environment01.id}"
  name = "z-branch-c-01"
  cpus = 2
  ram = 4096

  network_interface {
    interface_type = "vmxnet3"
    network_id = "${skytap_network.DC_LAN.id}"
    ip = "10.0.0.120"
    hostname = "z-branch-c-01"
  }
}

# Generate VM URL's
  output "http_z-branch-c-01" {
  value = "https://cloud.skytap.com/configurations/${skytap_environment.Environment01.id}/desktop?vm_id=${skytap_vm.z-branch-c-01.id}"
}

