/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



my_value = 25; // Fé que eu dou ao ser coletado


my_sprite = function()
{
	var _rnd =	irandom_range(0, 1);
	
	switch(_rnd)
	{
		case 0:
		{
			sprite_index = spr_holy_water;
		}
		break;
		case 1:
		{
			sprite_index = spr_holy_bible;
		}
		break;
	}
}



my_sprite();
