		//show up behind objects
		if instance_exists( o_player )
		{
	if point_in_rectangle(o_player.x, o_player.y, x-sprite_xoffset, y-sprite_yoffset, x-sprite_xoffset + sprite_width, y-sprite_yoffset + sprite_height)
	{
	  image_alpha = 0.5
	}
	else image_alpha = 1
		}