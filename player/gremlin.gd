extends CharacterBody2D

const SPEED = 200.0

var TEAM
var PLAYER
var target

var TEAM1_SPRITE = preload("res://images/player placeholder.png")
var TEAM2_SPRITE = preload("res://images/player 2 placeholder.jpg")

func _ready() -> void:
	$Sprite2D.texture = TEAM1_SPRITE if TEAM == 1 else TEAM2_SPRITE
	$TargetTimer.timeout.connect(_find_target)

func _find_target() -> void:
	var can_see = $View.get_overlapping_bodies()
	if can_see.size() == 0:
		target = PLAYER
		return
		
	var closest_obj = PLAYER
	var closest_dist = 10000.0
	for other in can_see:
		if other.TEAM != TEAM:
			var distance = (other.global_position - global_position).length()
			if distance < closest_dist:
				closest_obj = other
	
	target = closest_obj
	print(target)

func _get_input() -> Vector2:
	var direction = global_position.direction_to(target.global_position)
	return direction * SPEED

func _physics_process(_delta):
	var movement = _get_input()
	velocity = movement.normalized() * SPEED
		
	move_and_slide()
