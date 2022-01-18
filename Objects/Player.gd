extends KinematicBody2D

var velocity = Vector2(0, 0)
var facing: bool
var ball

func _process(delta: float):
	var co = 2 if Input.is_key_pressed(KEY_SHIFT) else 1
	if Input.is_key_pressed(KEY_W):
		velocity.y -= 5*co
	elif Input.is_key_pressed(KEY_S):
		velocity.y += 5*co
	if Input.is_key_pressed(KEY_D):
		facing = true
		velocity.x += 5*co
	if Input.is_key_pressed(KEY_A):
		facing = false
		velocity.x -= 5*co

	if Input.is_key_pressed(KEY_SPACE):
		shoot()
	velocity = velocity.clamped(20*co)
	$AnimatedSprite.animation = "right" if facing else "left"
	$AnimatedSprite.playing = (abs(velocity.x) > 1 || abs(velocity.y) > 1)
	if $AnimatedSprite.playing == false:
		$AnimatedSprite.frame = 0
	velocity = lerp(velocity, Vector2.ZERO, 0.1)
	velocity = move_and_slide(velocity, Vector2.UP)

func move_ball():
	ball.reset_state = global_position - Vector2((-1 if facing else 1)*7,7)

func acquire_ball(b):
	ball = b
	ball.disable()

func shoot():
	if !ball:
		return
	move_ball()
	ball.apply_central_impulse(velocity + (Vector2(1 if facing else -1,-10)*2))
	ball.toggle_gravity()
	ball.enable()
	ball = null
