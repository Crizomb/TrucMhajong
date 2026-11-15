extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@onready var steps: Label = $Steps
@onready var deaths: Label = $Deaths

func update_steps() -> void:
	steps.text = ": " + str(Global.movement_counter)

func update_deaths() -> void:
	deaths.text = ": " + str(Global.kill_counter)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_deaths()
	update_steps()
