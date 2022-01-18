extends Node2D


func _ready():
	$Net.connect("body_entered",self,"entered")

func entered(body):
	if body.name != "Ball":
		print("that isn't the ball")
		return