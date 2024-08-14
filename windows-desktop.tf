# Create a new vm https://cloud.skytap.com/vms/112750470
# from this template https://cloud.skytap.com/templates/2482807
resource "skytap_vm" "win10-01" {
  template_id = 2482807
  vm_id = 112750470
  environment_id = "${skytap_environment.Environment01.id}"
  name = "win10-01"
  cpus = 2
  ram = 4096

  network_interface {
    interface_type = "vmxnet3"
    network_id = "${skytap_network.DC_LAN.id}"
    ip = "10.0.0.10"
    hostname = "win10-01"
    }
  }

# Generate VM URL's
  output "http_win10-01" {
  value = "https://cloud.skytap.com/configurations/${skytap_environment.Environment01.id}/desktop?vm_id=${skytap_vm.win10-01.id}"
}
