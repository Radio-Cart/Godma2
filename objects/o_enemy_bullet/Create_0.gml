//Inherit parent event
event_inherited();

dir = 0;
spd = 3;
xspd = 0;
yspd = 0;

//state control
state = 0;
//0 = not moving, aim for player and wait fr enemy to shoot
//1 = shoot to player

//clean up
destroy = false;
playerDestroy = true;