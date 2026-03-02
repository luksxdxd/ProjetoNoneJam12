/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

switch(img_hold)
{
	case "mover":
	{
		sprite_index = spr_tutorial_mover
		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	break;
	case "pular":
	{
		sprite_index = spr_tutorial_pular;
		image_xscale = 1.2;
		image_yscale = 1.2;
	}
	break;
	case "shift":
	{
		sprite_index = spr_tutorial_shift;
	}
	break;
	case "ataca":
	{
		sprite_index = spr_tutorial_ataca;
		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	break;
	case "orar":
	{
		sprite_index = spr_tutorial_orar;
	}
	break;
	case "portal":
	{
		sprite_index = spr_tutorial_portal;
		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	break;
	case "curar":
	{
		sprite_index = spr_tutorial_curar;
		image_xscale = 1.2;
		image_yscale = 1.2;
	}
	break;
}




