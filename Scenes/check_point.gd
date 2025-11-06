extends Area2D

var checkpoint_manager
# Called when the node enters the scene tree for the first time.
@export var is_active: bool = false
@onready var sprite = $Sprite2D

func _ready():
	update_visual()

func _on_body_entered(body):
	if body.name == "Main_character":
		body.active_checkpoint = global_position
		is_active = true
		update_visual()
		print("Checkpoint activé à :", global_position)

func update_visual():
	if sprite:
		sprite.modulate = Color(0, 1, 0) if is_active else Color(1, 1, 1)
