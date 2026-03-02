/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _x_range = irandom_range((x - sprite_width/2) - past_range, (x + sprite_width/2) + past_range);

repeat(past_charge)
{
	instance_create_layer(_x_range, y, "Inimigos", obj_invoker,
	{
		image_xscale : 0.5,
		image_yscale : 0.5,
		paste_boss	 :true
	});
	
	_x_range = irandom_range((x - sprite_width/2) - past_range, (x + sprite_width/2) + past_range);
}




instance_destroy();
