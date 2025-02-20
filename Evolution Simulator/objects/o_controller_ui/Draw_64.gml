draw_text(8, 8, "Food: " + string(global.food));
draw_text(8, 24, "Creatures: " + string(global.creatures));

for (var j = 0; j < 2; j++) {
	var allele_map = count_allele_pairs(j);

	var allele_keys = ds_map_keys_to_array(allele_map);
	var allele_values = ds_map_values_to_array(allele_map);

	var allele_text = "Allele ";
	for (var i = 0; i < array_length(allele_keys); i++) {
		allele_text = allele_text + string(allele_keys[i]) + "[" + string(allele_values[i]) + "] ";
	}
	draw_text(8, 40 + j * 16, allele_text);
}