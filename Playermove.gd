extends CharacterBody3D

@onready var head = $Head
@onready var cam = $Head/Camera3D
var lookspeed = 0.002
var movevelo = 7.0
var jumpvelo = 4.5
var look_rotation_y = 0.0
var look_rotation_x = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_HIDDEN:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	if event is InputEventMouseMotion and Input.mouse_mode != Input.MOUSE_MODE_HIDDEN:
		print("hello")
		look_rotation_x = -event.relative.y * lookspeed
		head.rotate_x(clamp(look_rotation_x, deg_to_rad(-89), deg_to_rad(89.0)))
		rotate_y(-event.relative.x * lookspeed)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
