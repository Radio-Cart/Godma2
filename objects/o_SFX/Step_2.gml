//get the volume
var _sfxVol = 1;


//shoot sound
if shootSnd == true
{
	//play sound
	var _snd = audio_play_sound(snd_shoot, 8, false);
	audio_sound_gain( _snd, 1, 0 );
	
	//reset variable
	shootSnd = false;
}

//hurt sound
if hurtSnd == true
{
	//play sound
	var _snd2 = audio_play_sound(snd_hurt, 7, false);
	audio_sound_gain( _snd2, 1, 0 );
	
	//reset variable
	hurtSnd = false;
}