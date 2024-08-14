# Create a new vm APJ zappc80 https://cloud.skytap.com/vms/114453663
# Create a new vm APJ zappc90 https://cloud.skytap.com/vms/114453662
# from this template https://cloud.skytap.com/templates/2498629
resource "skytap_vm" "zappc80" {
  template_id = 2498629
  vm_id = 114453663
  environment_id = "${skytap_environment.Environment01.id}"
  name = "zappc80"
  cpus = 2
  ram = 4096

  network_interface {
    interface_type = "vmxnet3"
    network_id = "${skytap_network.DC_LAN.id}"
    ip = "10.0.0.80"
    hostname = "zappc80"
  }
}

# Generate VM URL's
  output "http_zappc80" {
  value = "https://cloud.skytap.com/configurations/${skytap_environment.Environment01.id}/desktop?vm_id=${skytap_vm.zappc80.id}"
}
