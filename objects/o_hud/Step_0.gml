//get players hp info
if instance_exists(o_player)
{
	playerHp = o_player.hp;
	playerMaxHp = o_player.maxHP;
} else {
	playerHp = 0;
}