extends Control

@onready var big_lock: Panel = $Big_lock

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var level = "level_23" # à compléter, doit matcher le niveau d'où l'on vient

func _on_resume_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/" + level + ".tscn")

func _on_options_button_up() -> void:
	big_lock.visible = false

func _on_options_button_down() -> void:
	big_lock.visible = true

func _on_level_select_button_up() -> void:
	print("it no work for pause")
	get_tree().change_scene_to_file("res://scenes/level_select_menu.tscn")
