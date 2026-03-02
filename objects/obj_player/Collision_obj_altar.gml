/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(orar && faith < global.max_faith && global.reino_espiritual == false)
{
	faith += faith_gain;
	check_point_spawn[0] = other.x;
	check_point_spawn[1] = other.y;
}