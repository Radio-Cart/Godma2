//randomise the seed
randomise();

//constructor template for weapons
function create_weapon( _sprite = s_burnt_twig, _length = 0, _bulletObj = s_magic_bullet, _cooldown = 1, _bulletNum =1, _spread = 0, _pickupSpr = s_soul_lantern_pickup ) constructor
{
	
	array_push(global.WeaponList, self);
	sprite = _sprite;
	length = _length;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	pickupSpr = _pickupSpr
	
}


//the players weapon inventory
global.PlayerWeapons = array_create(0);


//the weapons
global.WeaponList = [];
global.WeaponMap = {
	
	soulLantern : new create_weapon(
	s_soul_lantern, 
	sprite_get_bbox_right( s_soul_lantern ) - sprite_get_xoffset( s_soul_lantern), 
	o_magic_bullet, 
	9,
	1,
	0,
	s_soul_lantern_pickup
	),
	
	soulShotgun : new create_weapon(
	s_soul_lanternShotgun, 
	sprite_get_bbox_right( s_soul_lanternShotgun ) - sprite_get_xoffset( s_soul_lanternShotgun), 
	o_shotgun_bullet, 
	16,
	7,
	90,
	s_soullanternshotgun_pickup
	),
	
		soulLanternBlue : new create_weapon(
	s_soul_lantern_blue, 
	sprite_get_bbox_right( s_soul_lantern_blue ) - sprite_get_xoffset( s_soul_lantern_blue), 
	o_soul_bullet, 
	53,
	100,
	999,
	s_soullanternblue_pickup
	),
	
			soulRifle : new create_weapon(
	s_soul_lanternRifle, 
	sprite_get_bbox_right( s_soul_lanternRifle ) - sprite_get_xoffset( s_soul_lanternRifle), 
	o_rifle_bullet, 
	6,
	1,
	3,
	s_soullanternrifle_pickup
	),
	
			fetusLauncher : new create_weapon(
	s_soullanternGush, 
	sprite_get_bbox_right( s_soullanternGush ) - sprite_get_xoffset( s_soullanternGush), 
	o_beam, 
	8,
	1,
	1,
	s_soullanternfetus_pickup
	),
	
			excalibur : new create_weapon(
	s_excalibur, 
	sprite_get_bbox_right( s_excalibur ) - sprite_get_xoffset( s_excalibur), 
	o_excaliball, 
	70,
	1,
	0,
	s_excalibur_pickup
	),
			momsCig : new create_weapon(
	s_momscig, 
	sprite_get_bbox_right( s_momscig ) - sprite_get_xoffset( s_momscig), 
	o_ember, 
	8,
	4,
	45,
	s_momscig_pickup
	)
}
