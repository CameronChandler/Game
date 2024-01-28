extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	velocity = Vector2(0, 0)
	var movement = Vector2(0, 0)
	if Input.is_action_pressed("right"):
		movement.x += 1
	if Input.is_action_pressed("left"):
		movement.x -= 1
	if Input.is_action_pressed("up"):
		movement.y -= 1
	if Input.is_action_pressed("down"):
		movement.y += 1
	velocity += movement.normalized() * SPEED
		
	move_and_slide()
