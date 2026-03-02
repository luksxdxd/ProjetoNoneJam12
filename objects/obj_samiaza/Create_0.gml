/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


depth = 199;
 
vida_max	= 1000;
vida		= vida_max;
life_feedback = vida_max;

spell_fire_circle = true;
spell_fire_damage = 50;

spell_cast_skull				= true;
spell_cast_skull_invoke_charges = irandom_range(2, 4);
spell_cast_skull_range			= 225;

attack_cd	= irandom_range(180, 240);
attack_up	= 0;

estado = noone;

// Barra de vida
life_bar_w	= 80;
life_bar_h  = 10;
color_bg	  = make_color_rgb(19, 19 ,19); // Cor do background
color_outline = make_color_rgb(128, 128, 128); // Outiline da barrade  vida
color_vida	  = make_color_rgb(255, 0, 64); // Cor barra de vida
color_feedback = c_white;


// Estado Idle
estado_idle = function()
{
	muda_sprite(spr_boss_idle);
	
	if(attack_up == 0)
	{
		estado = estado_attack;
	}
	
	if(attack_up <= 0)
	{
		attack_up = 0;
	}
	else
	{
		attack_up--;
	}
}

estado_attack = function()
{
	var _rnd = irandom_range(1, 2);
	
	switch(_rnd)
	{
		case 1: // fire spell
		{
			if(spell_fire_circle)
			{
				muda_sprite(spr_boss_flash_attack);
				launch_fire_spell()
				attack_up = attack_cd;
			}
			else
			{
				estado = estado_idle;
			}
		}
		break;
		case 2:
		{
			if(spell_cast_skull)
			{
				muda_sprite(spr_boss_flash_attack);
				invoke_spell();
				attack_up = attack_cd;
			}
			else
			{
				estado = estado_idle;
			}
		}
	}
}

invoke_spell = function()
{
	var _spd = sprite_get_speed(sprite_index) /	game_get_speed(gamespeed_fps);
	
	if(image_index + _spd >= image_number)
	{
		instance_create_depth(x, y - sprite_height/2, depth - 1, obj_skull_cast,
		{
			image_xscale : 2,
			image_yscale : 2,
			past_charge : spell_cast_skull_invoke_charges,
			past_range : spell_cast_skull_range
		});
		
		alarm[1] = 360;
		spell_cast_skull = false;
		estado = estado_idle;
	}
}

// Habilidade de circulo de fogo
launch_fire_spell = function()
{
	
	var _spd = sprite_get_speed(sprite_index) /	game_get_speed(gamespeed_fps);
	
	if(image_index + _spd >= image_number)
	{	
		instance_create_depth(x, y - sprite_height/2, depth -1, obj_fire_cast,
		{
			image_xscale : 2,
			image_yscale : 2,
			past_damage : spell_fire_damage
		});
		
		alarm[0] = 240;
		spell_fire_circle = false;
		estado = estado_idle;	
	}
}


// Função para trocar sprite
muda_sprite = function(_sprite)
{
	if(sprite_index != _sprite)// Mudando sprite para de ataque quando entro no estado pela 1 vez
	{
		image_index  = 0;
		sprite_index = _sprite;
	}
}


take_damage = function(_dmg = 1)
{
	vida -= _dmg;
	
	if(vida <= 0)
	{
		estado = estado_death;
	}
}

estado_death = function()
{
	muda_sprite(spr_boss_death);
	
	var _spd = sprite_get_speed(sprite_index) /	game_get_speed(gamespeed_fps);
	
	if(image_index + _spd >= image_number)
	{
		room_goto(Final);
		instance_destroy();
	}
}


estado_dormindo = function()
{
	hspeed = 0;
	sprite_index = spr_skeleton_idle;
	
	if(global.reino_espiritual) estado = estado_idle;
}



estado = estado_attack;
