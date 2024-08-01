var _camX = camera_get_view_x( view_camera[0] );
var _camW = camera_get_view_width( view_camera[0] );
var _camY = camera_get_view_y( view_camera[0] );
var _camH = camera_get_view_height( view_camera[0] );

//draw a black rectangle over the screen
draw_set_alpha( alpha*alphaMax );
draw_rectangle_color( _camX, _camY, _camX + _camW, _camY + _camH, c_black, c_black, c_black, c_black, false );


//draw the text
	//draw the text
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_alpha(alpha);
	draw_set_font( fnt_Garamond );
	
	//"game over"
	var _gameoverOffset = -32;
	draw_text_transformed( _camX + _camW/2, _camY + _camH/2 + _gameoverOffset, "God Bless Your Soul, Jude...", 1, 1, 0 );
	
	//press shoot to restart
	var _restartOffset = 80;
		draw_text_transformed( _camX + _camW/2, _camY + _camH/2 + _restartOffset, "- Press Shoot To Restart -", 0.5, 0.5, 0 );
	
	//reset the alpha
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha( 1 );