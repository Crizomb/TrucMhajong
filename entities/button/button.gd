extends Area2D

class_name button

signal button_pressed;
signal button_unpressed;

# @export var Door : StaticBody2D;
@onready var button_off: Sprite2D = $ButtonOff
@onready var button_on: Sprite2D = $ButtonOn


func _on_area_entered(area: Area2D) -> void:
	button_off.visible = false
	button_on.visible = true
	button_pressed.emit()
	
	

func _on_area_exited(area: Area2D) -> void:
	button_unpressed.emit()
	button_off.visible = true
	button_on.visible = false
