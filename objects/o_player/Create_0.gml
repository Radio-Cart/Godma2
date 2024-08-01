//damage setup
	get_damaged_create(6, true);

//variables for movement
	moveDir = 0;
	moveSpd = 2.5;
	xspd = 0;
	yspd = 0;


//sprite control
	centerYOffset = -6;
	centerY = y +centerYOffset;//set in step event
	
weaponOffsetDist = 2;
	aimDir = 0;

	face = 0;
	sprite[0] = s_playerR;
	sprite[1] = s_playerup;
	sprite[2] = s_playerU;
	sprite[3] = s_playerdown;
	sprite[4] = s_playerL;
	sprite[5] = s_playerleft;
	sprite[6] = s_playerD;
	sprite[7] = s_playerright;
	
//weapon info
	shootTimer = 0;
	 
	 //add weapons to players inventory
	array_push( global.PlayerWeapons, global.WeaponMap.soulLantern );

	 selectedWeapon = 0;
	weapon = global.PlayerWeapons[selectedWeapon];
	
	//show_debug_overlay(true);
	show_debug_log(true);