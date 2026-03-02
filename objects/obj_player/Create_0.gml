/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//max_vida	= 100;
vida		= global.max_vida;


check_point_spawn	= [xstart, ystart];

//max_faith	= 100;
faith		= global.max_faith;
faith_drain	= 0.055; // +- 30 segundos no reino espiritual
faith_gain  = 0.5;

dir         = "right";
velov		= 0;
veloh		= 0;
velo_max	= 3;
forca_pulo	= -8; // padrão -8

gravidade	= 0.45;
chao		= false;
tilemap		= layer_tilemap_get_id("Mundo_fisico");
colisao		= [obj_colisor, obj_colisor_reino_espiritual, obj_door, tilemap, obj_skeleton, obj_colisor_some_noespiritual];

right		= false;
left		= false;
pulo		= false;
orar		= false;
atacar		= false;
curar		= false;
escudo		= false;

heal		= 30 * (global.max_faith/100);
heal_cd		= 180;
heal_timer	= heal_cd;

holy_shield = false;
holy_shield_cd	  = 600;
holy_shield_timer = 0;

// Variáveis de Dano
damage		= 10 * (global.max_faith/100); // Quanto mais Fé mais dano causo

debug_text	= "nada";

#region Variáveis Barra de Vida e De Fé
// Variáveis da GUI
// Camera Display
view_w = camera_get_view_width(view_camera[0]);
view_h = camera_get_view_height(view_camera[0]);
display_set_gui_size(view_w, view_h);

faith_bar_w	= 80;
faith_bar_h = 10;
life_bar_feedback = global.max_vida;
color_bg	  = make_color_rgb(19, 19 ,19); // Cor do background
color_faith	  = make_color_rgb(255, 255, 255); // Cor da barra de Fé
color_outline = make_color_rgb(128, 128, 128); // Outiline da barrade  Fé
color_vida	  = make_color_rgb(255, 0, 64);
color_feedback = c_white; // Cor do feedback

#endregion

estado = noone;

pega_inputs = function()
{
	right	= keyboard_check_direct(vk_right);
	left	= keyboard_check_direct(vk_left);
	pulo	= keyboard_check_direct(vk_space);
	orar	= keyboard_check_direct(ord("F"));
	atacar	= keyboard_check_direct(ord("A"));
	curar	= keyboard_check_pressed(ord("W"));
	escudo	= keyboard_check_pressed(ord("E"));
	
	veloh	= (right - left) * velo_max; // Velocidade horizontal
}

ajusta_escala = function()
{
	if(veloh < 0) // Olhando para Esquerda
	{
		image_xscale = -1;
		dir = "left";
		
	}
	else if(veloh > 0) // Olhando para Direita;
	{
		image_xscale = 1;
		dir = "right";
	}
}

checar_chao	= function()
{
	chao = place_meeting(x, y + 1, colisao);
}

estado_idle	= function()
{
	sprite_index = spr_knight_idle;
	aplica_gravidade();
	ajusta_escala();
	curar_spell();
	holy_shield_spell();
	
	debug_text = "Idle";	
	y = round(y);
	
	if(veloh != 0)
	{
		estado = estado_mover;
	}
	
	if(pulo)
	{
		velov = forca_pulo; // Aplicando força de pulo
		estado = estado_pular;
	}
	
	if(atacar && global.reino_espiritual)
	{
		estado = estado_ataque;
	}
}

estado_pular = function()
{		
	debug_text = "Pulando";
	
	aplica_gravidade();
	ajusta_escala();
	
	move_and_collide(veloh, 0, colisao, 8); // Movendo na horizontal
	
	if(chao) // estou tocando no "chão" então mudo para o estado idle
	{	
		estado  = estado_idle;
	}
	
	if(atacar && global.reino_espiritual)
	{
		estado = estado_ataque;
	}
	
	
}

// Estado de Movimento
estado_mover = function()
{
	sprite_index = spr_knight_walk;
	aplica_gravidade();
	ajusta_escala();
	curar_spell();
	holy_shield_spell();
	debug_text = "Mover";
	move_and_collide(veloh, 0, colisao, 8); // Movendo na horizontal
	
	if(pulo)
	{
		velov = forca_pulo; // Aplicando força de pulo
		estado = estado_pular;
	}
	
	if(atacar && global.reino_espiritual)
	{
		estado = estado_ataque;
	}
	
	if(veloh == 0)
	{
		estado = estado_idle;
	}
}


// Estado de Ataque
estado_ataque = function()
{
	aplica_gravidade();
	
	debug_text = "Ataque";
	if(sprite_index != spr_knight_attack1)// Mudando sprite para de ataque quando entro no estado pela 1 vez
	{
		image_index  = 0;
		sprite_index = spr_knight_attack1;
		audio_play_sound(snd_sword1, 0, false, 0.25, 0);
	}
	
	var _spd = sprite_get_speed(sprite_index) /	game_get_speed(gamespeed_fps);
	
	if(image_index + _spd >= image_number)
	{
		var _x;
		
		switch(dir)
		{
			case "right":
			{
				_x = x + (sprite_width/2);
			}
			break;
			case "left":
			{
				_x = x - (sprite_width/2) - 30;
			}
			break;
		}
		
		var _y = y - (sprite_height/ 2);
		
		instance_create_layer(_x, _y, "Inimigos", obj_player_dmg,
		{
			my_damage : damage
		});
		
		//if(atacar)
		//{
		//	
		//}
		
		estado = estado_combo_attack;
		
		//estado = estado_idle;
	}
	
}

estado_combo_attack = function()
{
	debug_text = "Combo Ataque";
	if(sprite_index != spr_knight_attack2)// Mudando sprite para de ataque quando entro no estado pela 1 vez
	{
		image_index  = 0;
		sprite_index = spr_knight_attack2;
		audio_play_sound(snd_sword2, 1, false, 0.5);
	}
	
	var _spd = sprite_get_speed(sprite_index) /	game_get_speed(gamespeed_fps);
	
	if(image_index + _spd >= image_number)
	{
		var _x;
		
		switch(dir)
		{
			case "right":
			{
				_x = x + (sprite_width/2);
			}
			break;
			case "left":
			{
				_x = x - (sprite_width/2) - 30;
			}
			break;
		}
		
		var _y = y - (sprite_height/ 2);
		
		instance_create_layer(_x, _y, "Inimigos", obj_player_dmg,
		{
			my_damage : damage
		});
		
		estado = estado_idle;
	}
}

aplica_gravidade = function()
{
	checar_chao();
	
	if(!chao)
	{
		velov += gravidade 
	}
	else
	{
		velov = 0;
	}
}

drain_faith = function()
{
	if(global.reino_espiritual == true)
	{
		faith -= faith_drain;
	}
	
	if(faith <= 0)
	{
		faith = 0;
		global.reino_espiritual = false;
	}
}

receber_dano = function(_dano = 1)
{
	if(holy_shield)
	{
		vida -= 1;
		holy_shield = false;
	}
	else
	{
		vida -= _dano;
	}
	
	if(vida < 0)
	{
		estado = estado_morte;
	}
}

estado_morte = function()
{
	if(sprite_index != spr_knight_death)// Mudando sprite para de ataque quando entro no estado pela 1 vez
	{
		image_index  = 0;
		sprite_index = spr_knight_death;
	}
	
	
	var _spd = sprite_get_speed(sprite_index) /	game_get_speed(gamespeed_fps);
	
	if(image_index + _spd >= image_number)
	{
		image_speed = 0;
		
		if(alarm[0] < 0) alarm[0] = 30;
		
		show_debug_message(alarm[0])
	}
	
	
}

//Habilidade do escudo sagrado
holy_shield_spell = function()
{
	if(escudo && faith >= 15 && holy_shield_timer <= 0)
	{
		holy_shield = true;
		faith -= 15;
		holy_shield_timer = holy_shield_cd; 
	}
	
	if(holy_shield_timer < 0)
	{
		holy_shield_timer = 0;
	}
	else
	{
		holy_shield_timer--;
	}
}

// Habilidade de curar
curar_spell = function()
{
	if(curar && faith >= 15 && heal_timer <= 0)
	{
		instance_create_depth(x, y, depth, obj_holy_power);
		faith -=15;
		vida += heal;
		heal_timer = heal_cd;
	}
	
	if(heal_timer < 0)
	{
		heal_timer = 0;
	}
	else
	{
		heal_timer --;
	}
	
	// Limitando o execesso de vida para ser sempre igual ao meu max_vida
	if(vida > global.max_vida)
	{
		vida = global.max_vida;
	}
}



estado = estado_idle;



