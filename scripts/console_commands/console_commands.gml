function add_health(amount = 1) {
	o_player.maxHP += amount;
}

function sub_health(amount = 1) {
	o_player.maxHP -= amount;
}

function spawn_gun() {
	instance_create_depth(736, 528, o_weapon_pickup.depth, o_weapon_pickup);
}