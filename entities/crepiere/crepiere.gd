extends Node2D
class_name Crepiere

@export var _is_activated := false
# Called when the node enters the scene tree for the first time.
@onready var crepe_off: TextureRect = $CrepeOff
@onready var crepe_on: TextureRect = $CrepeOn


var buttons: Array[GameButton] = []
var current_area: Area2D

func _ready():
	Global.test_crepiere.connect(_test_crepiere)
	var nodes_temp : Array[Node] = get_tree().get_nodes_in_group("button")
	for btn in nodes_temp:
		if btn is GameButton:
			buttons.append(btn)
			btn.button_pressed.connect(_on_one_of_btn_changed)
			btn.button_unpressed.connect(_on_one_of_btn_changed)
	
	if not buttons:
		activate()

func activate():
	crepe_off.visible = false
	crepe_on.visible = true
	_is_activated = true

func deactivate():
	crepe_off.visible = true
	crepe_on.visible = false
	_is_activated = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_entered(area: Area2D) -> void:
	current_area = area

func _test_crepiere():
	if current_area is Player and _is_activated:
		print("Crepiere activé + joueur crouched dessus")
		Global.change_level.emit()

func _on_one_of_btn_changed():
	var tree = get_tree()
	if tree:
		await tree.process_frame
	var all_pressed := true
	for btn in buttons:
		print(btn.is_pressed)
		if not btn.is_pressed:
			all_pressed = false
	
	print("all pressed")
	print(all_pressed)
	if all_pressed:
		activate()
	else:
		deactivate()
