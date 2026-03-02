/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.reino_espiritual == false)
{
	layer_set_visible("Reino_espiritual", false);
	instance_deactivate_layer("Reino_espiritual");
	
	instance_activate_object(obj_colisor_some_noespiritual);
	layer_set_visible("Mundo_fisico_some", true);
	
	layer_set_visible("Mundo_espiritual", false);
	
}
else
{
	layer_set_visible("Reino_espiritual", true);
	instance_activate_layer("Reino_espiritual");
	
	instance_deactivate_object(obj_colisor_some_noespiritual);
	
	layer_set_visible("Mundo_fisico_some", false);
	
	layer_set_visible("Mundo_espiritual", true);
	
}


ajusta_fundo();