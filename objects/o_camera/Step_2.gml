//get cameras width and height
var _camW = camera_get_view_width( view_camera[0] );
var _camH = camera_get_view_height( view_camera[0] );



//center on the player
if instance_exists( o_player)
{
	x = o_player.x - _camW/2;
	y = o_player.centerY - _camH/2;
}





//camera shaking
	//x shake
	if xShakeAmount > 0
	{
		xShakeDir += xShakeDirSpd;
		xShakeAmount -= xShakeAmountSpd;
	} else {
		xShakeAmount = 0;
		xShakeDir = 0;
	}
	xShake = dsin( xShakeDir ) * xShakeAmount;
	
	//y shake
	if yShakeAmount > 0
	{
		yShakeDir += yShakeDirSpd;
		yShakeAmount -= yShakeAmountSpd;
	} else {
		yShakeAmount = 0;
		yShakeDir = 0;
	}
	yShake = dsin( yShakeDir ) * yShakeAmount;

//add in the camera shake
x += xShake;
y += yShake;



//clamp cam pos to room borders
x = clamp( x, 0, room_width - _camW );
y = clamp( y, 0, room_height - _camH );


//set the cameras position
camera_set_view_pos( view_camera[0], x, y );