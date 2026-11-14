extends Node2D
class_name Crepiere

var _is_activated := true
# Called when the node enters the scene tree for the first time.
@onready var crepe_off: TextureRect = $CrepeOff
@onready var crepe_on: TextureRect = $CrepeOn

func activate():
	crepe_off.visible = false
	crepe_on.visible = true
	_is_activated = true

func deactivate():
	crepe_off.visible = true
	crepe_on.visible = false
	_is_activated = false
	
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	if area is Player and _is_activated:
		print("Crepiere activé + joueur dessus")
		Global.change_level.emit()
		


func _on_area_exited(area: Area2D) -> void:
	pass # Replace with function body.
