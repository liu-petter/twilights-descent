extends Camera2D

@export var tween_speed = 5

@onready var player: CharacterBody2D = get_node("%Player")

func _ready() -> void:
	position = player.position

func _physics_process(delta: float) -> void:
	position += (player.position - position) * tween_speed * delta
