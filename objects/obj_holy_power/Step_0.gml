/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(instance_exists(obj_player))
{
	var _player = instance_nearest(x, y, obj_player);
	
	x = _player.x;
	y = _player.y;
}