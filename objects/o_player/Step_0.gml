
//get inputs
rightKey = global.rightKey;
leftKey = global.leftKey;
upKey = global.upKey;
downKey = global.downKey;
shootKey = global.shootKey;
swapKeyPressed = global.swapKeyPressed;
startKeyPressed = global.startKeyPressed;


//pause menu
if startKeyPressed
{
	if !instance_exists(o_pause_menu)
	{
			instance_create_depth(0, 0, 0, o_pause_menu );
	} else {
		instance_destroy(o_pause_menu);	
	}
}

//fullscreen
if keyboard_check_pressed(ord("F")) 
{
window_set_fullscreen(!window_get_fullscreen());
}

//pause self
if screen_pause() {exit;};

//player movement
#region
   //get the direction
	var _horizKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	if (_horizKey != 0 || _vertKey != 0) {
  moveDir = point_direction(0, 0, _horizKey, _vertKey);
}
	//get the x and y speeds
	var _spd = 0;
	var _inputLevel = point_distance( 0, 0, _horizKey, _vertKey );
	_inputLevel = clamp( _inputLevel, 0, 1 )
	_spd =moveSpd * _inputLevel;
	
	xspd = lengthdir_x( _spd, moveDir );
	yspd = lengthdir_y( _spd, moveDir );
	
	//collisions
	if place_meeting(x + xspd, y, o_wall)
	{
	xspd = 0;
	}
if place_meeting(x, y + yspd, o_wall)
	{
	yspd = 0;
	}
	
	//move the player
	x += xspd;
	y += yspd;
	
	//depth
	depth = -bbox_bottom;
	
	
#endregion


//get damaged
if get_damaged(o_damage_player, true)
{
	//sound
	o_SFX.hurtSnd = true;
	
	//hit screen
	instance_create_depth(0, 0, 0, o_hit_screen );
	
	//screen pause
	create_screen_pause(25);
	
	//shake the screen
	screen_shake(6);
}

//player aiming
	centerY = y + centerYOffset;

//aim
	aimDir = point_direction( x, centerY, mouse_x, mouse_y );


//sprite control
	//make sure the player is facing the right dir
	face = round( aimDir/45 );
	if face == 8 { face = 0; };
	
//animate
if xspd == 0 && yspd == 0
{
	image_index = 0;
}	

	//set the player sprite
	mask_index = s_playerD
	sprite_index = sprite[face];
	
	
	
//weapon swapping
var _playerWeapons = global.PlayerWeapons;

	//cycle through weapons
	if swapKeyPressed
	{
		//change the selection and wrap around
		selectedWeapon++;
		if selectedWeapon >= array_length(_playerWeapons) { selectedWeapon = 0; };
		
 
	}
	
	//set the new weapon
		weapon = _playerWeapons[selectedWeapon];

//shoot the weapon
if shootTimer > 0 { shootTimer --; };
if shootKey && shootTimer <= 0
{
	
	//reset the timer
	shootTimer = weapon.cooldown;
	//shooting
	
	//screen shake
	screen_shake(1.2);
	
	//play sound
	o_SFX.shootSnd = true;
	
//shooting
	//create the bullet
	var _xOffset = lengthdir_x(weapon.length + weaponOffsetDist, aimDir );
	var _yOffset = lengthdir_y(weapon.length + weaponOffsetDist, aimDir );
	
	var _spread = weapon.spread;
	var _spreadDiv = _spread / max( weapon.bulletNum-1, 1 ) ;
	
	var _weaponTipX = x + _xOffset;
	var _weaponTipY = centerY + _yOffset;
	
	//create muzzle flash
	create_animated_vfx( s_muzzle_flash, _weaponTipX, _weaponTipY, depth - 10, aimDir );
	
	
	
	//creat correct number of bullets
	for ( var i = 0; i < weapon.bulletNum; i++ )
		{
	
			var _bulletInst = instance_create_depth( x + _xOffset, centerY + _yOffset, depth-100, weapon.bulletObj )
	
			//change the bullet's direction
			with( _bulletInst )
			{
				dir = other.aimDir - _spread/2 + _spreadDiv*i;
				
				//turn bullet to correct direction if neccisary
				if dirFix == true
				{
					image_angle =dir;
				}
			}

		}
}




//death
if hp <= 0
{
	//create game over object
	instance_create_depth(0, 0, -10000, o_game_over_screen);
	
	//blood
	create_animated_vfx(s_small_boom, x, y, depth);
	
	//destroy ourself
	instance_destroy();
	exit;
}