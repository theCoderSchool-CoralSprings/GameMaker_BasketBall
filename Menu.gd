extends Control

func _ready() -> void:
	OS.window_size = Vector2(1152,648)
	$Play.connect("pressed",self,"play")

func play():
	get_tree().change_scene("res://Game.tscn")

func _process(_delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
