#region Controles
key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_jump = keyboard_check(vk_space);
key_shoot = keyboard_check_pressed(ord(("X")))
#endregion

#region Movimentos
var move = key_right - key_left;
hspd = move * speed_player;

vspd = vspd + grvd;
if(hspd != 0) image_xscale = sign(hspd) //Flip

//Colisao horizontal
if(place_meeting(x+hspd,y,obj_ground)){
	while(!place_meeting(x+sign(hspd), y, obj_ground)){
		x += sign(hspd)
	}
	hspd = 0;
}
x += hspd
//Colisao Vertical
if(place_meeting(x,y+vspd,obj_ground)){
	while(!place_meeting(x,y+sign(vspd), obj_ground)){
		y += sign(vspd)
	}
	vspd = 0;
}
y += vspd

if(place_meeting(x,y+1,obj_ground) and key_jump){
	vspd -= force_jump
}
#endregion

#region  Tiros
var flipped = direction;
var gun_x = x+4*(flipped) //A onde vai sair o tiro
var _xx = x+ lengthdir_x(30,image_angle)
var y_offset = lengthdir_x(-30,image_angle)

if (key_shoot and global.bullets > 0){
	with (instance_create_layer(_xx,y+10,"shoot",obj_shoot)){
		global.bullets --;
		//Velocidade do tiro
		speed = 20;
		direction = -90 + 90 * other.image_xscale
		image_angle = direction
	}
}
#endregion


#region Sprites
if(!place_meeting(x,y+1,obj_ground)){
	sprite_index = spr_player_jump_start;
	if(sign(vspd) > 0.5) sprite_index = spr_player_jump_fall; else sprite_index = spr_player_jump_start;
}
else{
	if (hspd != 0){
		sprite_index = spr_player_run;
	}
}
if hspd = 0 {
	if place_meeting(x,y+1,obj_ground){
		sprite_index = spr_player_idle;
	}
}
if hspd != 0 {
	if(place_meeting(x,y+1,obj_ground)){
		sprite_index = spr_player_run;
	}
}


#endregion