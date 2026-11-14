extends Label
# Script exemple syntaxe


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("prout du label moche")
	print("current level : ")
	print(Global.current_level)
	Global.change_level.connect(_on_change_level)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Exemple d'utilisation d'inputs.
	# Pour rajouter des actions voir : Project -> Projects Settings -> Input Map
	if Input.is_action_just_pressed("MaSuperActionDeTest"): # Map sur 'k' ici, voir Input Map
		Global.change_level.emit()

func _on_change_level():
	print("On change de niveau aussi ici")
