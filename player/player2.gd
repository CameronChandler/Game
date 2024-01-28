extends AbstractPlayer

func _get_input() -> Vector2:
	var movement = Vector2(0, 0)
	if Input.is_action_just_pressed("p2_wall"):
		create_wall()
	if Input.is_action_pressed("p2_right"):
		movement.x += 1
	if Input.is_action_pressed("p2_left"):
		movement.x -= 1
	if Input.is_action_pressed("p2_up"):
		movement.y -= 1
	if Input.is_action_pressed("p2_down"):
		movement.y += 1

	return movement
