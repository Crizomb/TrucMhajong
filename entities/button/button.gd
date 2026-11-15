extends Area2D

class_name GameButton

signal button_pressed;
signal button_unpressed;

var is_pressed := false


func _on_area_entered(_area: Area2D) -> void:
	print("button pressed")
	button_pressed.emit()
	is_pressed = true

func _on_area_exited(_area: Area2D) -> void:
	print("button unpressed")
	button_unpressed.emit()
	is_pressed = false
