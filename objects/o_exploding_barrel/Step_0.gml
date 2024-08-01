get_damaged( o_damage_parent );

//show damage
var _healthPercent = 1 - (hp/maxHP);
image_index = _healthPercent * image_number;

if hp <= 0
{
	//create explosion
	instance_create_depth( x + 8, y + 8, -3000, o_explosion );
	
	//screen pause
	create_screen_pause(7);
	
	//screen sSHAKE ITOFF
	screen_shake(8);
	
	//destroy
	instance_destroy();
}