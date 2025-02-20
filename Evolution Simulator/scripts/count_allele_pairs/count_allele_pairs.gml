/// @function count_allele_pairs
/// @desc Counts allele pairs for a specific gene across the population
/// @param gene_index The index of the gene to analyze (0-based)
/// @return A ds_map of allele pairs and their counts

function count_allele_pairs(gene_index) {
    var counts = ds_map_create();

    with o_creature {
        // Get the allele pair for the specified gene
		var allele1 = allele[gene_index][0];
		var allele2 = allele[gene_index][1];
		var allele_pair = 0;
		if allele1 < allele2 {
			allele_pair = string(allele1) + "|" + string(allele2);
		} else {
			allele_pair = string(allele2) + "|" + string(allele1);
		}

        // Increment count in the map
        if (!ds_map_exists(counts, allele_pair)) {
            ds_map_add(counts, allele_pair, 1);
        } else {
			ds_map_replace(counts, allele_pair, ds_map_find_value(counts, allele_pair) + 1);
		}
    }

    return counts;
}