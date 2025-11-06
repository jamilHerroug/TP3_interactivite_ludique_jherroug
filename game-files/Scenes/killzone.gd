extends Area2D

@onready var timer: Timer = $Timer

var checkpoint_manager
var player_ref: Node = null

func _ready() -> void:
	checkpoint_manager = get_parent().get_parent().get_node("CheckpointManager")
	
func _on_body_entered(_body):
	if _body.name == "Main_character":
		_body.die()
	
	print("You Died")
	timer.start()


func _on_timer_timeout():
	if player_ref:
		player_ref.die()  
		player_ref = null
