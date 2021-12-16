if keyboard_check(ord("A")) {
 x -= 7;
 image_speed = 1.5
 dire = 1
 if (dire == 1) {
	 sprite_index = 0
 }
}

if keyboard_check(ord("D")) {
 x += 7;
 image_speed = 1.5
 dire = 0
 if dire = 0 {
	 sprite_index = 1
	
 }
}

if keyboard_check(ord("W")) {
 y -= 5;
 image_speed = 1.5
 if (dire == 1) {
	 sprite_index = 0
 }
 else {
	 sprite_index = 1
 }
}

if keyboard_check(ord("S")) {
 y += 5;
 image_speed = 1.5
 
 if (dire == 1) {
	 sprite_index = 0
 }
else {
	 sprite_index = 1
 }
}

if keyboard_check(vk_anykey) {
		if (y <= 1883) {
			layer_index = layer_index
		}
		else {
			//layer = layer+5
		}
}
		
