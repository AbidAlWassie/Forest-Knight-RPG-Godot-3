extends KinematicBody2D

const MAX_SPEED = 100
const ACCELERATION = 500
const FRICTION = 500

var velocity = Vector2.ZERO

func _ready():
	var class_data = load("res://Player/player_stats.tres")	
	var playerHealth = class_data.health
	var playerAttack = class_data.attack
	var playerDefense = class_data.defense
	
	print("player health: ", playerHealth)
	print("player attack: ", playerAttack)
	print("player defense: ", playerDefense)

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta) 
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)

	velocity = move_and_slide(velocity)
	
