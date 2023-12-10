#source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/core_subnet

resource "oci_core_subnet" "vcn-private-subnet"{

	#Required
	compartment_id="ocid1.compartment.oc1..aaaaaaaaz362qxneyuw7vialsglurkwrr47aa55dmqctpb42tlcppcto5y6q"
	vcn_id = module.vcn.vcn_id
	cidr_block = "10.0.1.0/24"

	route_table_id = module.vcn.nat_route_id
	security_list_ids = [oci_core_security_list.private-security-list.id]
	display_name = "private-subnet"
}
