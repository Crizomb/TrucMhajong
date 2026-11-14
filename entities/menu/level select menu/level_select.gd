extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

func _on_level_1_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_1.tscn")

func _on_level_2_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_2.tscn")

func _on_level_3_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_3.tscn")

func _on_level_4_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_4.tscn")

func _on_level_10_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_10.tscn")

func _on_level_11_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_11.tscn")

func _on_level_12_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_12.tscn")

func _on_level_13_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_13.tscn")

func _on_level_14_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_14.tscn")

func _on_level_20_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_20.tscn")

func _on_level_21_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_21.tscn")

func _on_level_22_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_22.tscn")

func _on_level_23_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_23.tscn")

func _on_level_24_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_24.tscn")

func _on_level_30_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_30.tscn")
