function sc_create_offspring() {
	var alleles = array_length(allele);
	with instance_create_layer(x, y, "Instances", o_creature) {
		for (var i = 0; i < alleles; i++) {
			allele[i] = other.allele[i];
		}
	}
}