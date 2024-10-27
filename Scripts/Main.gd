extends Node2D

@onready var pause_menu = $Player/Camera2D/Pause_menu
var pause = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pause_menu.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if pause:
		pause_menu.hide()
		Engine.time_scale=1
	else:
		pause_menu.show()
		Engine.time_scale=0
	
	pause = !pause
