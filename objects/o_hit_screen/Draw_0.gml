//draw over camera
var _camX = camera_get_view_x(view_camera[0] ) + (320);
var _camY = camera_get_view_y(view_camera[0] ) + (200);

draw_sprite_ext(sprite_index, 0, _camX, _camY, 1, 1, 0, c_white, alpha);