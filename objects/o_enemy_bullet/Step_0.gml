//pause self
if screen_pause() {exit;};

//state machine
switch (state)
{
	
	//wait for enemy to shoot state
	case 0:
	
		//aim for player
		if instance_exists( o_player )
		{
			dir = point_direction(x, y, o_player.x, o_player.y);
		}
		
		//set the depth to make myself visibke
		depth = -bbox_bottom - 50;
	
	break;
	
	//shoot/travel
	case 1:
	
		//movement
		xspd = lengthdir_x(spd, dir);
		yspd = lengthdir_y(spd, dir);
		x += xspd;
		y += yspd;
		
		//updating depth
		depth = -bbox_bottom;
		

}



//clean up
	//out of room bounds
	var _pad  = 16;
	if bbox_right < -_pad || bbox_left > room_width + _pad || bbox_bottom < -_pad || bbox_top > room_height + _pad
	{
		destroy = true;
	}

	//player collision
	if destroy == true 
	{
		//shoot burst
		create_animated_vfx(s_shoot_burst, x, y, depth);
		
		//destroy
		instance_destroy();
		}

	//actually destroy self
	if place_meeting( x, y, o_solid_wall ) { destroy= true };
	

	//wall collision
	if place_meeting( x, y, o_player ) && playerDestroy == true { destroy = true; };