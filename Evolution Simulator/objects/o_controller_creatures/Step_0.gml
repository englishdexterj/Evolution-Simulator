if global.creatures < minimum_creatures {
	with instance_create_layer(irandom(room_width), irandom(room_height), "Instances", o_creature) {
		sc_create_chromosomes();
		
		initialize_creature()
	}
}