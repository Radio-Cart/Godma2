//depth
if object_exists( o_player )
{
depth = -999;
}

//spawn an enemy
	timer ++;

	//reset timer the timer when enemy limits have been reached
	if instance_number(o_wendigo_parent) >= global.activeEnemyMax || global.totalEnemiesSpawned >= global.enemyRoomMax
	{
		timer = 0;
	}

	if timer >= spawnTime && !place_meeting(x, y+16, o_GRAMMY)
	{
	
		//create an enemy
		var _inst = instance_create_depth( x, y, depth-1, o_GRAMMY );
		with(_inst)
		{
			//make the zzombie invisible
			image_alpha = 0;
			state = -1;
		}
	
		//reset the timer
		timer = 0;
	
	}