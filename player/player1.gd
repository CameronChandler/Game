extends AbstractPlayer

func _ready():
	TEAM = 1
	super._ready()

func _get_input() -> Vector2:
	var movement = Vector2(0, 0)
	if Input.is_action_pressed("p1_right"):
		movement.x += 1
	if Input.is_action_pressed("p1_left"):
		movement.x -= 1
	if Input.is_action_pressed("p1_up"):
		movement.y -= 1
	if Input.is_action_pressed("p1_down"):
		movement.y += 1
		
	return movement
