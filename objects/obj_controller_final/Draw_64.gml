/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_texto_menu);
draw_set_color(c_black);

draw_text(room_width/2, room_height/2 - 80, "Você Mandou Samiaza")
draw_text(room_width/2, room_height/2, "para o abismo.");
draw_text(room_width/2, room_height/2 + 250, "O Fim.")

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_font(-1);
draw_set_color(-1);
