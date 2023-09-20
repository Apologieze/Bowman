extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -800.0

var mouse_pos: Vector2 = Vector2(0,0)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var dist: Vector2

func _physics_process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		mouse_pos = get_viewport().get_mouse_position()
		dist = (mouse_pos-position)
		if dist.length() > 5:
			velocity = dist * 5
			rotation = dist.angle()+PI/2
		else:
			velocity = Vector2(0,0)
	else:
		velocity = Vector2(0,0)


	
	move_and_slide()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	

