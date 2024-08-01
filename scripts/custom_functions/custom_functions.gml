//drawing the player's weapon
function draw_my_weapon()
{
	//draw the weapon
	//get the weapon o the players body
var _xOffset = lengthdir_x( weaponOffsetDist, aimDir );
var _yOffset = lengthdir_y( weaponOffsetDist, aimDir );

//flip weapon upright
var _weaponYscl = 1;
	if aimDir > 90 && aimDir < 270
{
	_weaponYscl = -1;
}

	draw_sprite_ext( weapon.sprite, 0, x + _xOffset, centerY + _yOffset, 0.8, _weaponYscl, aimDir, c_white, 1 );
}




//vfx
	function screen_pause()
		{
					//pause self
			if instance_exists(o_screen_pause)
			{
				image_speed = 0;
			
				return true;
			
			} else {
				image_speed = 1;
			
				return false;
			}
		}

	//create screen pause
	function create_screen_pause(_time = 3)
	{
		//screen pause
		with( instance_create_depth(0, 0, 0, o_screen_pause_timed) )
		{
			timer = _time;
		}
	}

	//screen shake
	function screen_shake( _amount = 3 )
	{
		with (o_camera)
		{
			xShakeAmount = _amount;
			yShakeAmount = _amount;
		
		
		}
	}

	//animated vfx
	function create_animated_vfx(_sprite, _x, _y, _depth, _rot = 0)
	{
		with(instance_create_depth(_x, _y, _depth, o_animated_vfx) )
		{
			sprite_index = _sprite;
			image_angle = _rot;
		}
	}

//damage calculation
	//damage create event
function get_damaged_create( _hp = 15, _iframes = false )
	{
		maxHP = _hp;
		hp = _hp;
		
		//get the iframes
		if _iframes == true
		{
			iframeTimer = 0;
			iframeNumber = 90;
		}

		//create the damage list
		if _iframes == false
		{
			damageList = ds_list_create();
		}
	}
	
	//damage clean up event
	function get_damaged_cleanup()
	{
		//DO NOT NEED if we're using iframes
		
		
		//delete our damage list data structure to free memory
ds_list_destroy(damageList);
	}
	
	//damage step
	function get_damaged( _damageObj, _iframes = false )
{
	

		//special exit for iframe timer
		if _iframes == true && iframeTimer > 0
		{
			iframeTimer--;
			
			if iframeTimer mod 5 == 0
			{
				if image_alpha == 1
				{
					image_alpha = 0;
				} else {
					image_alpha = 1;
				}
			}
			
					//clamp HP
			hp = clamp( hp, 0, maxHP );
		
		//exiting by returning function as false
		return false;
		
		}

		//make sure iframe blinking stops
		if _iframes == true
		{
		image_alpha = 1;
		}


		//recieve damage
	var _hitConfirm = false;
	
	if place_meeting( x, y, _damageObj ) 
	|| (_damageObj != o_damage_parent && place_meeting( x, y, o_damage_all ) )
	{
		
	//getting a list of the damage instances
	
		//creaet ds list and copy instances to it
		var _instList = ds_list_create();
		instance_place_list( x, y, _damageObj, _instList, false );
		if _damageObj != o_damage_parent
		{
			instance_place_list( x, y, o_damage_all, _instList, false );
		}
		
		//get the size of the list
			 var _listSize = ds_list_size( _instList );
		
		//loop through our list
			for(var i = 0; i < _listSize; i++ )
			{
				//get a damage object instance from the list
				var _inst = ds_list_find_value( _instList, i );
			
				//check if this instance is already in the damage list
				if _iframes == true || ds_list_find_index( damageList, _inst ) == -1
				{
					
					//add the new damage instance to the damage list
					if _iframes == false
					{
						ds_list_add( damageList, _inst );
					}
					
					//take damage from specific instance
					hp -= _inst.damage;
					_hitConfirm = true;
					//tell the damage instance to destroy itself
					_inst.hitConfirm = true;
					
					if _inst.hitVFX == true
					{
					//create an impact visual
					create_animated_vfx(s_shoot_burst, _inst.x, _inst.y, _inst.depth);
				}
			}
		}
		
			//set iframes if we were hit
			if _iframes == true && _hitConfirm
			{
				iframeTimer = iframeNumber;
			}
		
		
		//free memory by destroying the ds list
			ds_list_destroy( _instList );
		
	}
	
	//clear the damage list of objects that don't exist anymore or aren't touching anymore
	if _iframes == false
	{
			var _damageListSize = ds_list_size(damageList);
			for( var i = 0; i < _damageListSize; i++ )
			{
				//if not touching the damage instance anymore, remove it from the list AND set the loop back 1 position
				var _inst = ds_list_find_value( damageList, i );
				if !instance_exists( _inst ) || !place_meeting(x, y, _inst )
				{
					ds_list_delete( damageList, i );
					i--;
					_damageListSize--;
				}
			}
		}
		
		//clamp HP
		hp = clamp( hp, 0, maxHP );
		
		//return hit confirm variable value
		return _hitConfirm;
		
	}