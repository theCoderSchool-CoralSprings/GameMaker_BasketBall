extends RigidBody2D

var reset_state = Vector2()

func _ready():
	connect("body_entered", self, "body_entered")


	
func _integrate_forces(state):
	if reset_state != Vector2.ZERO:
		state.transform = Transform2D(0.0, reset_state)
		rotation_degrees = 0
		reset_state = Vector2.ZERO

func body_entered(body):
	if body.name == "Player":
		body.acquire_ball(self)


func disable():
	hide()
	$CollisionShape2D.disabled = true
	sleeping = true


func enable():
	show()
	$CollisionShape2D.disabled = false
	sleeping =false


func toggle_gravity():
	gravity_scale =0.75
	yield(get_tree().create_timer(0.75),"timeout")
	gravity_scale = 0
