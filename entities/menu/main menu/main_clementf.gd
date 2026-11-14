extends Control

@onready var small_lock: Panel = $Small_lock
@onready var big_lock: Panel = $Big_lock

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_clementb.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_options_button_up() -> void:
	small_lock.visible = true
	big_lock.visible = false

func _on_options_button_down() -> void:
	small_lock.visible = false
	big_lock.visible = true
