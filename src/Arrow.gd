extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -800.0

var mouse_pos: Vector2 = Vector2(0,0)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var dist: Vector2

func _physics_process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
#		mouse_pos = get_viewport().get_mouse_position()
#		dist = (mouse_pos-position)
#		if dist.length() > 5:
#			velocity = dist * 5
#			rotation = dist.angle()+PI/2
#		else:
#			velocity = Vector2(0,0)
		pass
	else:
		velocity.x *= 0.99
		$Camera2D.zoom = Vector2(1-velocity.length()*0.0002, 1-velocity.length()*0.0002)
		if not is_on_floor():
			if not Input.is_action_pressed("click"):
				velocity.y += gravity * delta
				rotation = velocity.angle()+PI/2
		else:
			velocity.x = 0
			


	print(top_level)
	move_and_slide()	


func _on_visible_on_screen_notifier_2d_screen_exited():
	$Camera2D.enabled = true
