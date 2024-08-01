get_damaged( o_damage_parent );

//show damage
var _healthPercent = 1 - (hp/maxHP);
image_index = _healthPercent * image_number;

if hp <= 0
{
	//burst
	create_animated_vfx(s_smoke, x, y, depth);
	
	instance_destroy();
}