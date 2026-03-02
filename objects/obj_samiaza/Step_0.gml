/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


if(global.reino_espiritual)
{
	visible = true;
	
}
else
{
	estado = estado_dormindo;
	visible = false;
}


life_feedback = approach(life_feedback, vida, 1);

estado();