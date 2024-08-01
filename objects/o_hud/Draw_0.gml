var _camX = camera_get_view_x( view_camera[0] );
var _camY = camera_get_view_y( view_camera[0] );

//central HUD coords
var _border = 8;
var _hudX = _camX + _border;
var _hudY = _camY + _border;

//draw the players hp
	if instance_exists(o_player)
	{
	draw_sprite( s_player_health, 0, _hudX, _hudY );

	for( var i = 0; i < playerMaxHp; i++ )
{
	
	//show current hp
	var _img = 1;
	if i+1 <= playerHp  { _img = 2; };
	
	var _sep = 16;
	draw_sprite( s_player_health, _img, _hudX + _sep*i, _hudY );
}
	}
	
//draw enemy kill count
var _enemyCountOffset = 24;
var _ecHudX = _hudX;
var _ecHudY = _hudY + _enemyCountOffset;

	//draw the background box
	draw_sprite( s_enemy_count_hud, 0, _ecHudX, _ecHudY );
	
	//draw the text
	draw_set_halign( fa_left);
	draw_set_valign( fa_top);
	draw_set_font( fnt_TBOI );
	
		//current enemy killcount
		draw_text( _ecHudX + 20, _ecHudY + 4, string(global.enemyKillCount) );
		
		//total enemies in level count
		draw_text( _ecHudX + 44, _ecHudY + 4, "/" + string(  global.enemyRoomMax ) );