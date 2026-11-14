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
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau1.tscn")

func _on_level_2_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau2.tscn")

func _on_level_3_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau3.tscn")

func _on_level_4_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau4.tscn")

func _on_level_10_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau10.tscn")

func _on_level_11_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau11.tscn")

func _on_level_12_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau12.tscn")

func _on_level_13_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau13.tscn")

func _on_level_14_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau14.tscn")

func _on_level_20_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau20.tscn")

func _on_level_21_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau21.tscn")

func _on_level_22_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau22.tscn")

func _on_level_23_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau23.tscn")

func _on_level_24_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau24.tscn")

func _on_level_30_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau30.tscn")
