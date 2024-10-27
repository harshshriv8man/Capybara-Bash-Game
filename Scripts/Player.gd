extends CharacterBody2D

@export var SPEED = 450.0
@export var JUMP_VELOCITY = -250
@export var GRAVITY = 300.0

@onready var capybara: Sprite2D = $Character
@onready var winpopup = $"../WinPopup"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity.y += GRAVITY * delta
	horizontal_movement()
	flip_animation()
	move_and_slide()
	
	if position.y > 650:
		capybara.rotate(0.05)
	if position.y > 850:
		# winpopup.popup()
		get_tree().change_scene_to_file("res://GUI/Game_over.tscn")
		# winpopup.popup()
	
func flip_animation():
	if Input.is_action_pressed("ui_left") || Input.is_action_just_released("ui_jump"):
		capybara.flip_h = true
	
	if Input.is_action_pressed("ui_right") || Input.is_action_just_released("ui_jump"):
		capybara.flip_h = false

func horizontal_movement() -> void:
	var hz_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = hz_input * SPEED

# _input for prolonged action (such as sprinting, jumping, climbing, etc)
func _input(event):
	if event.is_action_pressed("ui_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func _on_spike_trap_body_entered(_body: CharacterBody2D) -> void:
	get_tree().change_scene_to_file("res://GUI/Game_over.tscn")

func _on_berry_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://GUI/Win.tscn")
