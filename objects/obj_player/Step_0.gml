/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
// Se o jogador Apertar SHIFT
if(keyboard_check_pressed(vk_shift) && vida > 0 && faith > 0) 
{
	global.reino_espiritual = !global.reino_espiritual;
}

move_and_collide(0, velov, colisao, 24);

pega_inputs();
drain_faith();
estado();

life_bar_feedback = approach(life_bar_feedback, vida, 1);

if(y > room_height)
{
	receber_dano(1000);
}
