// Inherit the parent event
event_inherited();

get_damaged_create(700, false);
spd = 3;
chaseSpd = 3;
dir = 0;
xspd = 0;
yspd = 0;


face = 1;

//state machine
state = 0;
	// spawn from alter state
	fadeSpd = 1/15;
	emergeSpd = .25;
	
	//shooting state
	cooldownTime = 1*60;
	shootTimer = irandom( cooldownTime );
	windupTime = 30;
	recoverTime = 40;
	bulletInst = noone;
	
	bulletXoff = 6;
	bulletYoff = -7;