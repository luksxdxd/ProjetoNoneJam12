/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

instance_create_layer(x, y, "Inimigos", obj_skeleton,
{
	my_father  : father_door,
	_boss : paste_boss
});

instance_destroy();