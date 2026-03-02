/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_self();

//draw_text(x, y -140, "Direcção: " + dir);
//draw_text(x, y -120, "Estado: " + debug_text);
//draw_text(x, y -100, "Velocidade: " + string(veloh));
//draw_text(x, y -80, "velov: " + string(velov));
//draw_text(x, y -60, "Faith: " + string(faith));



if(holy_shield)
{
	draw_sprite(spr_holy_shield, -1, x, y - sprite_height/2);
}

if(global.reino_espiritual)
{
	depth = 98;
	//draw_sprite_ext(spr_kobold_idle, image_number, x, y, image_xscale, image_yscale, direction, c_white, 0.5);
}