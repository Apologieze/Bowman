extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var string = $String

var mouse_click: Vector2 = Vector2(0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("click"):
		$String.set_point_position(1, ((get_viewport().get_mouse_position()-mouse_click)*0.1+Vector2(-8,0)))
	

func _input(event):
	if event.is_action_pressed("click"):
		mouse_click = get_viewport().get_mouse_position()
	elif event.is_action_released("click"):
		$String.set_point_position(1, Vector2(-5,0))
