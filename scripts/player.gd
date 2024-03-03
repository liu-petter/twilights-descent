extends CharacterBody2D

@export var speed = 125
@export var friction:float = 50

@export var dash_speed: float = 300
@export var dash_time: float = 1.25
@export var dash_cooldown: float = 1.5

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var input_direction = Vector2(0,0)

func _ready() -> void:
	pass

func get_input():
	input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction.normalized() * speed
	return input_direction
	
func _process(_delta):
	input_direction = get_input()
	move_and_slide()
	animate()
	
func animate() -> void:
	if velocity.x < 0:
		sprite.flip_h = 1
	elif velocity.x > 0:
		sprite.flip_h = 0
