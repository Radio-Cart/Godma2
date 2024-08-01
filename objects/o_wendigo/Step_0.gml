//pause self
if screen_pause() {exit;};




//code commands
var _wallCollisions = true;
var _getDamaged = true;

//state machine
switch( state )
{
	//spawn in from alter
	case -1:
	
	//fade in
	if image_alpha < 1
	{
		//dont walk while fading in
		spd = 0;
		image_alpha += fadeSpd;
	}
	
	//walk out
	_wallCollisions = false;
	_getDamaged = false;
	if image_alpha >= 1
	{
		//set the right spd and direction
		spd = emergeSpd;
		dir = 270;
	}
	
	//switch to the chase state
	if !place_meeting(x, y, o_wall)
	{
		state = 0;
	}
	
	break;
	
	
	//chase state
		case 0:
	#region
					//get the players direction
			if instance_exists( o_player )
			{
				dir = point_direction( x, y, o_player.x, o_player.y );
			}
			
			//set the correct speed
			spd = chaseSpd;
	
	//transition to shooting state
		var _camLeft = camera_get_view_x( view_camera[0] );
		var _camRight = _camLeft + camera_get_view_width( view_camera[0] );
		var _camTop = camera_get_view_y( view_camera[0] );
		var _camBottom = _camTop + camera_get_view_height( view_camera[0] );
		
		//only add to timer if onscreen
		if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom
		{
			shootTimer++;
		}
		
	if shootTimer > cooldownTime
		{
		//go to shoot state
		state = 1;
		
		//reset timer so shooting state can use too
		shootTimer = 0;
	}

	#endregion
		break;


	//pause and shoot state
		case 1:
	#region
				//get the players direction
			if instance_exists( o_player )
			{
				dir = point_direction( x, y, o_player.x, o_player.y );
			}
		//set the correct speed
		spd = 0;
		
		//stop animating/ manually set image index
		image_index = 0;
	
		//shoot a bullet
			shootTimer ++;
		
		//create the bullet
			if shootTimer == 1
			{
				bulletInst = instance_create_depth( x + bulletXoff*face, y +bulletYoff, depth, o_enemy_bullet );
			}
			
			//keep the bullet in monsters hand
			if shootTimer <= windupTime && instance_exists( bulletInst )
			{
				bulletInst.x = x + bulletXoff*face;
				bulletInst.y = y + bulletYoff*face;
			}
			
			//shoot bullet after windup time is over
			if shootTimer == windupTime && instance_exists( bulletInst )
			{
				//set our bullets state to movement state
				bulletInst.state = 1;
			}
			
			//recover and chase player
			if shootTimer > windupTime + recoverTime
			{
				//go back to chasing player
				state = 0;
				
				//reset the timer so we can use it again
				shootTimer = 0;
			}
			
			
		#endregion
		break;
	
}

//chase the player

//geting the speeds
	xspd = lengthdir_x( spd, dir );
	yspd = lengthdir_y(spd, dir );
	
	//get the correct face
	if dir > 90 && dir < 270
	{
		face = -1;
	} else {
		face = 1;
	}
	
	//collisons
		//wall collisions
	if _wallCollisions == true
		{
				if place_meeting(x + xspd, y, o_wall )
				{
				xspd = 0;
				}
			if place_meeting(x, y + yspd, o_wall )
				{
				yspd = 0;
				}
		}
		//enemy collisions
				if place_meeting(x + xspd, y, o_wendigo_parent )
				{
				xspd = 0;
				}
			if place_meeting(x, y + yspd, o_wendigo_parent )
				{
				yspd = 0;
				}
		
	
	//moving
	x += xspd;
	y += yspd;

	//set the depth
		depth = -bbox_bottom;



// Inherit the parent event
if _getDamaged = true
{
			//getting damaged and dying
		event_inherited();
}