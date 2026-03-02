/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(keyboard_check_pressed(vk_up))
{
	switch(meu_valor)
	{
		case "fase2":
		{
			room_goto(Fase_02);
		}
		break;
		case "fase3" :
		{
			room_goto(Fase_Boss);
		}
	}
}