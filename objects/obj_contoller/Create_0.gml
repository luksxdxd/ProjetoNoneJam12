/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

ajusta_fundo = function()
{
	var _clouds_back    = layer_get_id("Background");
	var _clouds_front   = layer_get_id("Front_clouds");
	var _mountain_front = layer_get_id("Front_mountain");
	var _mountain_back  = layer_get_id("Back_mountain");
	
	// PEgando view camera do eixo X
	var _x_mountain_front = lerp(0, camera_get_view_x(view_camera[0]), 0.5 );
	var _x_mountain_back = lerp(0, camera_get_view_x(view_camera[0]), 0.7 );
	var _x_clouds_front = lerp(0, camera_get_view_x(view_camera[0]), 0.85 );
	var _x_clouds_back = lerp(0, camera_get_view_x(view_camera[0]), 0.9 );
	
	// PEgando view camera do eixo Y
	//var _y_mountain_front = lerp(0, camera_get_view_y(view_camera[0]), 0.5);
	//var _y_mountain_back = lerp(0, camera_get_view_y(view_camera[0]), 0.7);
	//var _y_clouds_front = lerp(0, camera_get_view_y(view_camera[0]), 0.85);
	//var _y_clouds_back = lerp(0, camera_get_view_y(view_camera[0]), 0.9);
	
	// Aplicando parallax no X
	layer_x(_mountain_front, _x_mountain_front);
	layer_x(_mountain_back, _x_mountain_back);
	layer_x(_clouds_front, _x_clouds_front);
	layer_x(_clouds_back, _x_clouds_back);
	
	// Aplicando  Parallax no Y
	//layer_y(_mountain_front, _y_mountain_front);
	//layer_y(_mountain_back, _y_mountain_back);
	//layer_y(_clouds_front, _y_clouds_front);
	//layer_y(_clouds_back, _y_clouds_back);
	
}