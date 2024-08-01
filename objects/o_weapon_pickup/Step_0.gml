//pause self
if screen_pause() {exit;};

depth = 200;

//float in place
floatDir += floatSpd;
y = ystart + lengthdir_y(1, floatDir);

//set the correct sprite
sprite_index = weapon.pickupSpr;


	//does the player already have this weapon?
		var _size = array_length(global.PlayerWeapons);
			for (var i = 0; i < _size; i++ )
			{
				//check if weapon is already in inventory
				if weapon == global.PlayerWeapons[i]
				{
					instance_destroy();
					exit;
				}
			}


//add to players inventory
if place_meeting(x, y, o_player)
{
	
	//add the weapon
	array_push( global.PlayerWeapons, weapon );
	
	//set as the players weapon
	o_player.selectedWeapon = array_length( global.PlayerWeapons ) -1;
	
	//destroy
	instance_destroy();
	
}

