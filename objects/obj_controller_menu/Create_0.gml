/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


my_options = ["Jogar", "Sair"];
text_selected = 0;
d_color = c_dkgray;
s_color = c_yellow;


desenha_textos = function()
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_texto_menu);
	
	draw_text_color(room_width/2, (room_height/2) - 300, "Between Faith and Flesh", d_color, d_color, d_color, d_color, 1);
	
	for(var i = 0; i < array_length(my_options); i++)
	{
		if(i == text_selected)
		{
			draw_text_color(room_width/2, (room_height/2) + (i * 100), my_options[i], s_color, s_color, s_color, s_color, 1);
		}
		else
		{
			draw_text_color(room_width/2, (room_height/2) + (i * 100), my_options[i], d_color, d_color, d_color, d_color, 1);
		}
		
	}
	
	
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
	
}

texto_selecionado = function()
{
	var _up, _down, _select;
	_up		= keyboard_check_pressed(vk_up);
	_down	= keyboard_check_pressed(vk_down);
	_select	= keyboard_check_pressed(vk_enter);
	
	
	if(_up)		text_selected --;
	if(_down)	text_selected ++;
	
	if(_select)
	{
		switch(text_selected)
		{
			case 0:	room_goto(Fase_01); break;
			case 1: game_end(); break;
		}
	}
	
	text_selected = clamp(text_selected, 0, array_length(my_options) - 1);
}