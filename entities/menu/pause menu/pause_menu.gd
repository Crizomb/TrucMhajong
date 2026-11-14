extends Control

@onready var big_lock: Panel = $Big_lock
@onready var pause_menu: Control = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Escape"):
		pause_menu.visible = !pause_menu.visible

func _on_resume_button_up() -> void:
	pause_menu.visible = false

func _on_options_button_up() -> void:
	big_lock.visible = false

func _on_options_button_down() -> void:
	big_lock.visible = true

func _on_level_select_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/level_select_menu.tscn")
