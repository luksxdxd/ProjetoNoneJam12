/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

draw_self();

// Barra de Vida
var _amount_life		= (vida / vida_max) * life_bar_w;
var _amount_life_fixo	= (vida_max / vida_max) * life_bar_w;
var _amount_feedback	= (life_feedback / vida_max) *life_bar_w;
var _life_x1	  = x - (life_bar_w / 2);
var _life_y1	  = y + life_bar_h;
var _life_x2	  = _life_x1 + _amount_life;
var _life_x2_fixo = _life_x1 + _amount_life_fixo;
var _life_y2	  = _life_y1 + life_bar_h; 
var _x2_feedback = _life_x1 + _amount_feedback;

// Background
draw_set_color(color_bg);
draw_rectangle(_life_x1, _life_y1, _life_x2_fixo, _life_y2, false);//BG Barra de vida


// Outline da barra de vida
draw_set_color(color_outline);
draw_rectangle(_life_x1, _life_y1, _life_x2_fixo, _life_y2, true);

// Feedback
draw_set_color(color_feedback);
draw_rectangle(_life_x1, _life_y1, _x2_feedback, _life_y2, false);//BG Barra de vida

// Desenhando a barra de vida
draw_set_color(color_vida);
draw_rectangle(_life_x1, _life_y1, _life_x2, _life_y2, false);
draw_set_color(-1);