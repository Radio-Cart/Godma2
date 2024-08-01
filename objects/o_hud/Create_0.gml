//make sure this thing shows up on top
depth = -9000;

//keep track of player hp
playerHp = 0;
playerMaxHp = 0;

//resize gui
display_set_gui_size(360, 240);

//enemy managment
global.enemyRoomMax = 50;
global.activeEnemyMax = 10;
global.totalEnemiesSpawned = 0;
global.enemyKillCount = 50;