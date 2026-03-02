/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(global.reino_espiritual)
{
	visible = true;
	velov += gravidade;
	move_and_collide(hs_velo, 0, colisao);
}
else
{
	visible = false;
	estado = estado_dormindo;
}


if(y > room_height)
{
	take_damage(1000);
}

aplica_gravidade();
ajusta_escala();
estado();

