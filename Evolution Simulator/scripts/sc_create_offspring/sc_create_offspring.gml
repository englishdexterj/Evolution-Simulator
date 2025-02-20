function sc_create_offspring() {
	var alleles = array_length(allele);
	with instance_create_layer(x, y, "Instances", o_creature) {
		for (var i = 0; i < alleles; i++) {
			for (var j = 0; j < 2; j++) {
				allele[i, 0] = other.allele[i, 0];
				allele[i, 1] = other.allele[i, 1];
			
				if random(1) < global.mutation_chance allele[i, irandom(1)] = irandom(25) + 1;
			}
		}
		
		initialize_creature();
	}
	
	reproduction_timer = reproduction_timer_max;
}