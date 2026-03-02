/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _sum = 0;

repeat(12)
{
	instance_create_layer(x, y, "Player", obj_fire_elipse,
	{
		direction : 0 + _sum,
		fire_damage : past_damage,
		depth : 199
	});
	
	_sum += 30;
}



instance_destroy();
