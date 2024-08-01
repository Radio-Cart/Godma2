		//recieve damage
get_damaged( o_damage_enemy );


	
if hp <= 0 and state!=2 {
	
  if object_index = o_the_thing
  {
	  sprite_index = s_the_thing_death;
	  
	  image_index = 0;
	  
	  image_speed = 1;
	  
    state = 2;
  } else if hp <= 0 and state!=2 {
	
  if object_index = o_sofy
  {
	  sprite_index = s_sofy_death;
	  
	  image_index = 0;
	  
	  image_speed = 1;
	  
    state = 2;
  }
  else
  {
	  //add to the total amount of enemies killed
	  global.enemyKillCount++;
	  
	  //determine if we should drop an item
		var _chance = irandom(100);
		if _chance < 10
	  {
		  //create thingy
		  instance_create_depth(x, y, depth, o_heart);
	  }
	  
	    
	  //determine if we should drop an item
		if global.enemyKillCount mod global.enemyRoomMax == 0
	  {
		  //create thingy
		  instance_create_depth(x, y, depth, o_weapon_pickup);
	  }
	  
	  //burst vfx
	  create_animated_vfx(s_small_boom, x, y, depth);
	  
	  //destroy self
    instance_destroy();
	 }
	}
}