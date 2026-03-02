/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

text_view = true;


if(keyboard_check_pressed(ord("Z")))
{
	show_message(my_text);
	global.max_faith += 5;
	instance_destroy();
}