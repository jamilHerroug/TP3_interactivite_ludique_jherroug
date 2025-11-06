extends CharacterBody2D


const SPEED = 115.0
const JUMP_VELOCITY = -305.0

var start_position: Vector2
var active_checkpoint: Vector2


@onready var anim = $AnimatedSprite2D

func _ready():
	start_position = position
	active_checkpoint = start_position
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		anim.play("jump")
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("run_left", "run_right")
	
	if direction > 0:
		anim.flip_h = false
	elif direction < 0:
			anim.flip_h = true
		
	if direction:
		anim.play("run")
		velocity.x = direction * SPEED
	else:
		anim.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func die():
	print("Le joueur est mort, respawn au checkpoint :", active_checkpoint)
	respawn()
	
func respawn():
	position = active_checkpoint
	velocity = Vector2.ZERO
