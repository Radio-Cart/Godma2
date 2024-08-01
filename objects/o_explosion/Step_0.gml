//pause self
if screen_pause() {exit;};

//create damage objects
if createdDamageObjects == false
{
	
		//create an object to damage enemies
		damageInst = instance_create_depth( x, y, 0, o_damage_all );
		with(damageInst)
		{
			damage = other.damage;
			mask_index = other.sprite_index;
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
		}
	
	

	//set created var to true so we dont make a million dmg objects
	createdDamageObjects = true;
	
}

//get rid of damage instance once theyre done
if image_index >= 5
{
	//destroy
	if instance_exists(damageInst)
	{
		instance_destroy(damageInst);
	}

}