//draw self to be flipped right way
draw_sprite_ext( sprite_index, image_index, x, y, face, image_yscale, image_angle, c_white, image_alpha );

//draw hp
var _healthPercent = hp / maxHP;
var _hpImage =  _healthPercent*( sprite_get_number( s_enemy_healthbar ) -1) ;
draw_sprite_ext( s_enemy_healthbar, _hpImage, x, y - sprite_height - 1, image_xscale, image_yscale, image_angle, image_blend, image_alpha );
