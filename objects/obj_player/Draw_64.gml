/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Barra de Fé
var _amount		 = (faith / global.max_faith) * faith_bar_w; // Formula	da faith bar (mostrar o quanto ainda tneho)
var _amount_fixo = (global.max_faith / global.max_faith) * faith_bar_w; // Background
var _amount_feedback = (life_bar_feedback / global.max_vida) * faith_bar_w;
var _x1		 = (view_w / 8) - (faith_bar_w / 2);
var _y1		 = view_h / 8;
var _x2		 = _x1 + _amount;
var _x2_fixo = _x1 + _amount_fixo;
var _y2		 = _y1 + faith_bar_h;


// Barra de Vida
var _amount_life		= (vida / global.max_vida) * faith_bar_w;
var _amount_life_fixo	= (global.max_vida / global.max_vida) * faith_bar_w;
var _life_x1	  = (view_w / 8) - (faith_bar_w / 2);
var _life_y1	  = view_h / 12;
var _life_x2	  = _life_x1 + _amount_life;
var _life_x2_fixo = _life_x1 + _amount_life_fixo;
var _life_y2	  = _life_y1 + faith_bar_h; 
var _x2_feedback = _life_x1 + _amount_feedback;


// Background
draw_set_color(color_bg);
draw_rectangle(_life_x1, _life_y1, _life_x2_fixo, _life_y2, false);//BG Barra de vida
draw_rectangle(_x1, _y1, _x2_fixo, _y2, false);// Bg barra de Fé
draw_set_color(-1);



// Contorno das barras
draw_set_color(color_outline);
draw_rectangle(_life_x1, _life_y1, _life_x2_fixo, _life_y2, true);
draw_rectangle(_x1, _y1, _x2_fixo, _y2, true);
draw_set_color(-1);

if(faith > 0)
{	
	// Desenhando a Faith bar
	draw_set_color(color_faith)
	draw_rectangle(_x1, _y1, _x2, _y2, false);
	draw_set_color(-1);
}

if(vida > 0)
{
	// Feedback
	draw_set_color(color_feedback);
	draw_rectangle(_life_x1, _life_y1, _x2_feedback, _life_y2, false);//BG Barra de vida
	draw_set_color(-1)
	
	// Desenhando a barra de vida
	draw_set_color(color_vida);
	draw_rectangle(_life_x1, _life_y1, _life_x2, _life_y2, false);
	draw_set_color(-1);
}