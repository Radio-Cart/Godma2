//pause self
if screen_pause() {exit;};

image_angle = dir;

//move
	xspd = lengthdir_x( spd, dir );
	yspd = lengthdir_y ( spd, dir );

	x += xspd;
	y += yspd;
	
//cleanup

	//hit confirm destroy
	if hitConfirm == true && enemyDestroy == true { destroy = true; };

	//destroy
	if destroy ==true
	{
		//shoot burst
		create_animated_vfx(s_shoot_burst, x, y, depth);
		
		//destroy
		instance_destroy();
		}
	
	//collison
	if place_meeting( x, y, o_solid_wall ) or place_meeting( x, y, o_wendigo )
	{
		destroy = true;
	}
	
	//bullet out of range
	if point_distance( xstart, ystart, x, y, ) > maxDist
	{
		destroy = true;
	}