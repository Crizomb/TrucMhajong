extends TileMapLayer
@onready var player: Area2D = $"../Player"


enum CaseColor {BLUE, GREEN, RED, YELLOW}
var CaseDict : Dictionary[Vector2i, CaseColor] = {Vector2i(3, 0) : CaseColor.GREEN, Vector2i(5, 0): CaseColor.BLUE}

func get_player_case_color(position: Vector2):
	var player_int_pos := local_to_map(position)
	var atlas_cords := get_cell_atlas_coords(player_int_pos)
	return CaseDict[atlas_cords]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(get_player_case_color(player.position))
