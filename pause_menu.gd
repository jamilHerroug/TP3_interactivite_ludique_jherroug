extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	Esc()

func resume():
	get_tree().paused = false
	visible = false

func pause():
	get_tree().paused = true
	visible = true

func Esc():
	if Input.is_action_just_pressed("pause_menu") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("pause_menu") and get_tree().paused == true:
		resume()


func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()

func _on_exit_pressed() -> void:
	pass # Replace with function body.
