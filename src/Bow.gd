extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

@onready var Arrow: CharacterBody2D = get_node("Arrow")
@onready var string: Line2D = get_node("Parts/String")
@onready var Parts: Node2D = get_node("Parts")
var mouse_click: Vector2 = Vector2(0,0)
var pos_calc: Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("click"):
		pos_calc = get_viewport().get_mouse_position()-mouse_click
		pos_calc.x = max(pos_calc.x, -800)
		pos_calc.y = min(pos_calc.y, 800)
		string.set_point_position(1, Vector2(-abs(pos_calc.length()*0.1),0))
		rotation = (pos_calc+Vector2(-1,0)).angle()+PI
		Parts.scale.y = 1-0.0003*pos_calc.length()
		Parts.scale.x = 1+0.0003*pos_calc.length()
		Arrow.position = (string.get_point_position(1)*Parts.scale) + Vector2(15,0)
		Arrow.velocity = Vector2(0,0)
		Arrow.rotation = PI/2
	else:
		rotation=0
	

func _input(event):
	if event.is_action_pressed("click"):
		mouse_click = get_viewport().get_mouse_position()
	elif event.is_action_released("click"):
		Arrow.velocity=-pos_calc*4
		string.set_point_position(1, Vector2(0,0))
		Parts.scale = Vector2(1,1)
