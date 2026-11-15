extends Control

@onready var big_lock: Panel = $Big_lock
@onready var pause_menu: Control = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Escape"):
		if pause_menu.visible:
			get_tree().paused = false
			pause_menu.visible = false
		else:
			get_tree().paused = true
			pause_menu.visible = true

func _on_resume_button_up() -> void:
	get_tree().paused = false
	pause_menu.visible = false

func _on_options_button_up() -> void:
	big_lock.visible = false

func _on_options_button_down() -> void:
	big_lock.visible = true
	Global.metal_pipe.emit()

func _on_level_select_button_up() -> void:
	Global.movement_counter = 0
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menus/level_select_menu.tscn")
