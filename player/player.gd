extends CharacterBody2D

class_name AbstractPlayer

const SPEED = 300.0

func _get_input() -> Vector2:
	return Vector2(0, 0)

func _physics_process(delta):
	var input = _get_input()
	velocity = Vector2(0, 0)
	var movement = input
	velocity += movement.normalized() * SPEED
		
	move_and_slide()
