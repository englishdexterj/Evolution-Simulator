function sc_create_chromosomes() {
	//chromosome 1 (3 alleles)
	allele[0, 0] = choose(4, 4);
	allele[0, 1] = choose(4, 4);
	
	allele[1, 0] = choose(10, 10);
	allele[1, 1] = choose(10, 10);
	
	allele[2, 0] = choose(1, 2);
	allele[2, 1] = choose(1, 2);
}