# Create a new network
resource "skytap_network" "DC_LAN" {
  environment_id = "${skytap_environment.Environment01.id}"
  name = "DC_LAN"
  domain = "zscalerlabz.net"
  subnet = "10.0.0.0/24"
  gateway = "10.0.0.254"
}
# Create a new network
resource "skytap_network" "Campus_LAN" {
  environment_id = "${skytap_environment.Environment01.id}"
  name = "Campus_LAN"
  domain = "zscalerlabz.net"
  subnet = "10.0.10.0/24"
  gateway = "10.0.10.254"
}
# Create a new network
resource "skytap_network" "Mgmt_LAN" {
  environment_id = "${skytap_environment.Environment01.id}"
  name = "Mgmt_LAN"
  domain = "zscalerlabz.net"
  subnet = "10.0.4.0/24"
  gateway = "10.0.4.254"
}
# Create a new network
resource "skytap_network" "Remote1" {
  environment_id = "${skytap_environment.Environment01.id}"
  name = "Remote1"
  domain = "zscalerlabz.net"
  subnet = "10.0.1.0/24"
  gateway = "10.0.1.254"
}
# Create a new network
resource "skytap_network" "Remote2" {
  environment_id = "${skytap_environment.Environment01.id}"
  name = "Remote2"
  domain = "zscalerlabz.net"
  subnet = "10.0.2.0/24"
  gateway = "10.0.2.254"
}
# Create a new network
resource "skytap_network" "Remote3" {
  environment_id = "${skytap_environment.Environment01.id}"
  name = "Remote3"
  domain = "zscalerlabz.net"
  subnet = "10.0.3.0/24"
  gateway = "10.0.3.254"
}
