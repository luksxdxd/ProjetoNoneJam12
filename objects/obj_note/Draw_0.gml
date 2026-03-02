/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_self()

if(text_view)
{
	draw_set_color(c_black);
	draw_set_font(fnt_item_textos);
	draw_text_ext_transformed(x - sprite_width/2, y - 50, "Aperte Z para pegar nota ", 10, 10, 1, 1, image_angle);
	
	
	draw_set_font(-1);
	draw_set_color(-1);
}
	