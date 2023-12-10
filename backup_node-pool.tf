#source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_node_pool

resource "oci_containerengine_node_pool" "oke-node-pool" {
	#Required
	cluster_id = oci_containerengine_cluster.oke-cluster.id
	compartment_id = "ocid1.compartment.oc1..aaaaaaaaz362qxneyuw7vialsglurkwrr47aa55dmqctpb42tlcppcto5y6q" 
	kubernetes_version = "v1.27.2"
	name = "pool1"
	node_config_details{
		placement_configs{
			availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
			subnet_id = oci_core_subnet.vcn-private-subnet.id
		}

		placement_configs{
			availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
			subnet_id = oci_core_subnet.vcn-private-subnet.id
		}
		
		placement_configs{
			availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name

			subnet_id = oci_core_subnet.vcn-private-subnet.id
		}
		size = 3
	}
	node_shape = "VM.Standard2.1"

	#Using image Oracle-Linux-7.x-<date>
	
	node_source_details {
		image_id = "ocid1.image.oc1.iad.aaaaaaaamc2xy64p4r4tcwjy26ksdkehrdrzjcacw4upaq7fnqict55as4kq"
		source_type = "image"
	}

}	
