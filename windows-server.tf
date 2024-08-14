# Create a new vm https://cloud.skytap.com/vms/112801286
# from this template https://cloud.skytap.com/templates/2483375
# This VM is sysprepped to hlp avoid conflicting SID's
resource "skytap_vm" "win22-srv01" {
  template_id = 2483375
  vm_id = 112801286
  environment_id = "${skytap_environment.Environment01.id}"
  name = "win22-srv01"
  cpus = 2
  ram = 8192

  network_interface {
    interface_type = "vmxnet3"
    network_id = "${skytap_network.DC_LAN.id}"
    ip = "10.0.0.100"
    hostname = "win22-srv01"
  }
}

# Generate VM URL's
  output "http_win22-srv01" {
  value = "https://cloud.skytap.com/configurations/${skytap_environment.Environment01.id}/desktop?vm_id=${skytap_vm.win22-srv01.id}"
}
