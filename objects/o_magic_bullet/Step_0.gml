//pause self
if instance_exists(o_screen_pause)
{
	image_speed = 0;
	exit;
} else {
	image_speed = 1;
}


//move
	xspd = lengthdir_x( spd, dir );
	yspd = lengthdir_y ( spd, dir );

	x += xspd;
	y += yspd;
	
//cleanup

	//hit confirm destroy
	if hitConfirm == true && enemyDestroy == true { destroy = true; };

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
	if point_distance( xstart, ystart, x, y ) > maxDist
	{
		destroy = true;
	}