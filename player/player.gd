extends CharacterBody2D

class_name AbstractPlayer

const SPEED = 300.0

func _ready() -> void:
	$GremlinTimer.timeout.connect(_spawn_gremlin)

func _get_input() -> Vector2:
	return Vector2(0, 0)

func _physics_process(delta):
	var input = _get_input()
	velocity = Vector2(0, 0)
	var movement = input
	velocity += movement.normalized() * SPEED
		
	move_and_slide()

func _spawn_gremlin():
	var gremlin = preload("res://player/gremlin.tscn").instantiate()
	get_parent().add_child(gremlin)
	gremlin.global_position = self.global_position
