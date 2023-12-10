#Output the "list" of all availability domains.
output "all-availability-domains-in-your-tenancy" {
	value = data.oci_identity_availability_domains.ads.availability_domains
}
# Outputs for the vcn module

output "vcn_id" {
	description = "OCID of the VCN that is created"
	value = module.vcn.vcn_id
}

output "id-for-route-table-that-includes-the-internet-gateway"{
	description = "OCID of the internet-route table. This route tablet has an internet gateway to be used for public subnets"
	value = module.vcn.ig_route_id
}

output "id-for-for-route-table-that-includs-the-nat-gateway" {
	description = "OCID of the nat-route table - this route table has a nat gateway to be used for private subnets. This route table also has a service gateway."
	value = module.vcn.nat_route_id
}
output "public-security-list-name" {
	value = oci_core_security_list.public-security-list.display_name
}
output "public-security-list_OCID"{
	value = oci_core_security_list.public-security-list.id
}



output "private-security-list-name" {
	value = oci_core_security_list.private-security-list.display_name
}
output "private-security-list-OCID" {
	value = oci_core_security_list.private-security-list.id
}
output "private-subnet-name" {

	value = oci_core_subnet.vcn-private-subnet.display_name
}

output "private-subnet-OCID"{
	value = oci_core_subnet.vcn-private-subnet.id
}


#Outputs for public subnet

output "public-subnet-name" {
	value = oci_core_subnet.vcn-public-subnet.display_name
}

output "public-subnet-OCID" {
	value = oci_core_subnet.vcn-public-subnet.id
}



