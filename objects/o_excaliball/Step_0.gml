 //pause self
if screen_pause() {exit;};
 
 //move
	xspd = lengthdir_x( spd, dir );
	yspd = lengthdir_y ( spd, dir );

	x += xspd;
	y += yspd;
	
//cleanup

	//hit confirm destroy
	if hitConfirm == true || place_meeting(x, y, o_solid_wall)
	{
		instance_create_depth(x, y, -bbox_bottom, o_explosion);
		
	if enemyDestroy == true { destroy = true; };
	}

	//destroy
	if destroy == true
	{
		//shoot burst
		create_animated_vfx(s_shoot_burst, x, y, depth);
		
		//destroy
		instance_destroy();
	}
	
	//collison
	if place_meeting( x, y, o_solid_wall )
	{
		destroy = true;
	}
	
	//bullet out of range
	if point_distance( xstart, ystart, x, y, ) > maxDist
	{
		destroy = true;
	}
