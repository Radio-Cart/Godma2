//pause self
if screen_pause() {exit;};

//float in place
floatDir += floatSpd;
y = ystart + lengthdir_y(2, floatDir);



//get collected by the player
if place_meeting( x, y, o_player)
{
	//heal the player
	o_player.hp += heal;
	
	//destroy self
	instance_destroy();
}