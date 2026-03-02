/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//Definition Variable:
// invoke_charges
// Dir
// _y_

invoke_range	= 150;
invoked_minion  = [];


checar_proximidade_player = function()
{
	if(instance_exists(obj_player))
	{
		var _player = instance_nearest(x, y, obj_player);
		var _dist	= point_distance(x, y, _player.x, _player.y);
		
		
		if(_dist < invoke_range)
		{
			return true;
		}
		else
		{
			return false;
		}
		
	}
}

// Função para sumonar inimigos
invocando_inimigos	= function()
{
	if(checar_proximidade_player() && invoke_charges > 0)
	{
		var _player = instance_nearest(x, y, obj_player);
	
		
		switch(dir)
		{
			case "right":
			{
				var _inimigo instance_create_layer(random_range(x + sprite_width/2, x + (invoke_range/2)), _y_, "Objetos_espiritual", obj_invoker,
				{
					father_door : id,
					image_xscale : 0.5,
					image_yscale : 0.5
				});
			}break;
			case "left":
			{
				var _inimigo instance_create_layer(random_range(x - sprite_width/2, x - (invoke_range/2)), _y_, "Objetos_espiritual", obj_invoker,
				{
					father_door : id,
					image_xscale : 0.5,
					image_yscale : 0.5
				});
			}
			break
		}
		
		
		
		
		array_push(invoked_minion, invoke_charges); // Adicionando no array que temum inimigo vivo
		invoke_charges --;
	}
}

liberar_portal = function()
{
	if(invoke_charges == 0 && array_length(invoked_minion) <= 0 )
	{
		image_alpha -= 0.03;
		
		if(image_alpha <= 0) instance_destroy();
	}
}


// Está função é para facilitar a exclusão do array pelo inimigo invocado
deletar_array = function()
{
	array_pop(invoked_minion);
}