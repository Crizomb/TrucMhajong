extends Area2D

class_name GameButton

signal button_pressed;
signal button_unpressed;

var is_pressed := false

# @export var Door : StaticBody2D;
@onready var button_off: Sprite2D = $ButtonOff
@onready var button_on: Sprite2D = $ButtonOn

func _on_area_entered(_area: Area2D) -> void:
	print("area entered")
	button_off.visible = false
	button_on.visible = true
	button_pressed.emit()
	is_pressed = true

func _on_area_exited(_area: Area2D) -> void:
	button_unpressed.emit()
	button_off.visible = true
	button_on.visible = false
	is_pressed = false
