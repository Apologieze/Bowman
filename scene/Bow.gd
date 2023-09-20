extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

@onready var Arrow: CharacterBody2D = get_node("../Arrow")
var mouse_click: Vector2 = Vector2(0,0)
var pos_calc: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("click"):
		pos_calc = get_viewport().get_mouse_position()-mouse_click
		$String.set_point_position(1, Vector2(-abs(pos_calc.length()*0.05-1),0))
		rotation = (pos_calc+Vector2(-1,0)).angle()+PI
		scale.y = 5/(0.0004*pos_calc.length()+1)
		scale.x = 5+0.001*pos_calc.length()
#		Arrow.position = position+$String.get_point_position(1)*5
	

func _input(event):
	if event.is_action_pressed("click"):
		mouse_click = get_viewport().get_mouse_position()
	elif event.is_action_released("click"):
		$String.set_point_position(1, Vector2(0,0))
		scale = Vector2(5,5)
