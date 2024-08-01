weapon = global.WeaponMap.soulLantern;

var pos = irandom(array_length(global.WeaponList)-1);

weapon = global.WeaponList[pos];

//float
floatDir = 0;
floatSpd = 6;

//does the player already have this weapon?
	var _size = array_length(global.PlayerWeapons);
		for (var i = 0; i < _size; i++ )
		{
			//check if weapon is already in inventory
			if weapon == global.PlayerWeapons[i]
			{
				instance_destroy();
			}
		}