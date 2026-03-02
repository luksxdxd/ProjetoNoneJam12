/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

depth = 99;
debug_state = "noone";
tl_colisor	= layer_tilemap_get_id("Mundo_fisico");
colisao		= [obj_colisor, obj_colisor_reino_espiritual, obj_door, tl_colisor, obj_player];

cd_posture	   = 25;
change_posture = cd_posture;

vida		= 50;

// Movimento
gravidade	= 0.5;
velov		= 0;
hs_velo		= 1;
move_cd		= 30;
move_sec	= move_cd;
dir         = "right";

// Ataque
atq_damage	= irandom_range(8, 12);
atq_range	= 80;
atq			= 0;
atq_cd		= 30;
move_to_atq = 15;
move_cd_atq = 12;

estado = noone;

// Estado Idle
estado_idle = function()
{
	debug_state = "Idle";
	hs_velo = 0;
	sprite_index = spr_skeleton_idle;
	
	checar_proximidade_player();
	
	if(change_posture <= 0)
	{
		var _rnd = choose(0, 1);
		
		if(_rnd == 0)
		{
			change_posture = cd_posture;
			exit;
		}
		else if(_rnd == 1) // Indo para o estado_movendo
		{
			var _dir = choose(0, 1); // escolhendo 2 valores: 0 elevai para esquerda <-, 1 ele vai para direita ->
			
			if(_dir == 0)
			{
				hs_velo = -1;
			}
			else if(_dir == 1)
			{
				hs_velo = 1;
			}
			
			change_posture = cd_posture;
			estado = estado_movendo;
		}
	}
	else
	{
		change_posture --;
	}
	
	atq --;
}

// Estado d eMovimento
estado_movendo = function()
{
	debug_state = "Mover";
	sprite_index = spr_skeleton_move;
	
	checar_proximidade_player();
	
	if(move_sec <= 0)
	{
		move_sec = move_cd;
		estado = estado_idle;
	}
	else
	{
		move_sec --;
	}
	atq --;
}

// Função pra checar se o player está no alcance de ataque
checar_proximidade_player = function()
{
	if(instance_exists(obj_player))
	{
		var _player = instance_nearest(x, y, obj_player);
		var _dist	= point_distance(x, y, _player.x, _player.y);
		var _dir	= point_direction(x, y, _player.x, _player.y);
		
		
		
		if(_dist < atq_range && global.reino_espiritual && atq <= 0)
		{
			if(_dir < 90)
			{
				hs_velo = 1; // Direita
			}else if(_dir > 90 )
			{
				hs_velo = -1; // Esquerda
			}
			estado = estado_atacar;
		}	
	}
}

// Estado de Ataque
estado_atacar = function()
{
	debug_state = "Ataque"
	if(move_to_atq <= 0)
	{
		if(hs_velo != 0) // entrei no loop 1 vez, eu paro a velocidade e zero a animação da sprite
		{
			hs_velo = 0;
			image_index = 0;
			sprite_index = spr_skeleton_atq;
			audio_play_sound(snd_sword3, 0, false, 0.25, 0, random_range(0.5, 1.5));
		}
		
		var _spd = sprite_get_speed(sprite_index) /	game_get_speed(gamespeed_fps);
		
		
		
		if(image_index + _spd >= image_number)
		{
			var _x;
			
			switch(dir)
			{
				case "right":
				{
					_x = x + sprite_width/2;
				}
				break;
				case "left":
				{
					_x = x - sprite_width/2;
				}
			}
			
			instance_create_layer(x + sprite_width/2, y - sprite_height/2, "Player", obj_skeleton_dmg,
			{
				damage : atq_damage
			});
			move_to_atq = move_cd_atq;
			atq	= atq_cd;
			estado = estado_idle;
		}
	}
	else
	{
		move_to_atq --;
	}
}

// Apliganco gravidade
aplica_gravidade = function()
{
	repeat(abs(velov))
	{
		if(place_meeting(x, y + sign(velov), colisao))
		{
			velov = 0;
			break;
		}
		else
		{
			y += sign(velov);
		}
	}
}

estado_dormindo = function()
{
	hspeed = 0;
	sprite_index = spr_skeleton_idle;
	
	if(global.reino_espiritual) estado = estado_idle;
}

ajusta_escala = function()
{
	if(hs_velo < 0)
	{
		dir = "left";
		image_xscale = -1;
		
	}
	else if(hs_velo > 0)
	{
		dir = "right";
		image_xscale = 1;
	}
}

// Estado Leva Dano
take_damage = function(_dmg = 1)
{
	vida -= _dmg;
	
	if(vida <= 0)
	{
		if(_boss == false)
		{
			my_father.deletar_array();
			instance_destroy();
		}
		else
		{
			instance_destroy();
		}
	}
}




estado = estado_idle;