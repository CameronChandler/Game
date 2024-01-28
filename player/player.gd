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

	if velocity.x < 0:
		$Sprite2D.flip_h = true
	elif velocity.x > 0:
		$Sprite2D.flip_h = false

func create_wall():
	print('create wall')
	var wall = preload("res://wall.tscn").instantiate()
	wall.global_position = global_position + 100*velocity.normalized()
	wall.rotation = atan2(velocity.y,velocity.x)
	get_parent().add_child(wall)
	

