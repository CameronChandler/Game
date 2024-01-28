extends CharacterBody2D

class_name AbstractPlayer

const SPEED = 300.0

var TEAM: int = 0

func _ready() -> void:
	$GremlinTimer.timeout.connect(_spawn_gremlin)

func _get_input() -> Vector2:
	return Vector2(0, 0)

func _physics_process(delta):
	var input = _get_input()
	velocity = Vector2(0, 0)
	var movement = input
	velocity += movement.normalized() * SPEED
	
	if velocity.x < 0:
		$Sprite2D.flip_h = true
	elif velocity.x > 0:
		$Sprite2D.flip_h = false
		
	move_and_slide()

func _spawn_gremlin():
	print('Spawn!')
	var gremlin = preload("res://player/gremlin.tscn").instantiate()
	gremlin.TEAM = TEAM
	gremlin.target = self
	gremlin.PLAYER = self
	get_parent().add_child(gremlin)
	gremlin.global_position = self.global_position
