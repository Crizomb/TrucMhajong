extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_back_button_up() -> void:
	Global.current_level = -1
	get_tree().change_scene_to_file("res://scenes/menus/main_menu.tscn")

func _on_level_1_button_up() -> void:
	Global.current_level = 0
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_1, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau1.tscn")

func _on_level_2_button_up() -> void:
	Global.current_level = 1
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_2, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau2.tscn")

func _on_level_3_button_up() -> void:
	Global.current_level = 2
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_3, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau3.tscn")

func _on_level_4_button_up() -> void:
	Global.current_level = 3
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_4, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau4.tscn")

func _on_level_10_button_up() -> void:
	Global.current_level = 4
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_10, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau10.tscn")

func _on_level_11_button_up() -> void:
	Global.current_level = 4+1
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_11, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau11.tscn")

func _on_level_12_button_up() -> void:
	Global.current_level = 6
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_12, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau12.tscn")

func _on_level_13_button_up() -> void:
	Global.current_level = 7
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_13, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau13.tscn")

func _on_level_14_button_up() -> void:
	Global.current_level = 8
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_14, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau14.tscn")

func _on_level_20_button_up() -> void:
	Global.current_level = 9
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_20, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau20.tscn")

func _on_level_21_button_up() -> void:
	Global.current_level = 10
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_21, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau21.tscn")

func _on_level_22_button_up() -> void:
	Global.current_level = 11
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_22, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau22.tscn")

func _on_level_23_button_up() -> void:
	Global.current_level = 12
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_23, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau23.tscn")

func _on_level_24_button_up() -> void:
	Global.current_level = 13
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_24, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau24.tscn")

func _on_level_30_button_up() -> void:
	Global.current_level = 14
	Global.reset_message_counters()
	Global.try_message(Global.DeathReason.NARATION_INTRO_LEVEL_30, 610/2)
	get_tree().change_scene_to_file("res://scenes/Niveaux/niveau30.tscn")
