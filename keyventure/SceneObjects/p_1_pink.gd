extends CharacterBody2D

const SPEED = 400
const JUMP_VELOCITY = -700
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	add_to_group("player")

func _physics_process(delta: float) -> void:
	#Animation
	if (velocity.x > 1 || velocity.x < -1):
		animated_sprite_2d.animation = "run"
	else:
		animated_sprite_2d.animation = "default"
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite_2d.animation = "jump"

	if Input.is_action_just_pressed("jump.p1") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var direction := Input.get_axis("left.p1", "right.p1")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 100)

	move_and_slide()
	var isLeft = velocity.x < 0
	animated_sprite_2d.flip_h = isLeft
