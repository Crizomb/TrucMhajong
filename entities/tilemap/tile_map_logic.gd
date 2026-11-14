extends TileMapLayer
@onready var player: Area2D = $"../Player"


enum CaseColor {NULL, BLUE, GREEN, RED, YELLOW}
var CaseDict : Dictionary[Vector2i, CaseColor] = {Vector2i(3, 0) : CaseColor.RED, Vector2i(4, 0): CaseColor.BLUE, Vector2i(5, 0): CaseColor.GREEN, Vector2i(3, 1): CaseColor.YELLOW}

func get_case_color(player_int_pos: Vector2i) -> CaseColor:
	# var player_int_pos := local_to_map(player_pos)
	var atlas_cords := get_cell_atlas_coords(player_int_pos)
	if atlas_cords in CaseDict:
		return CaseDict[atlas_cords]
	return CaseColor.NULL

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.player_moved.connect(_on_player_moved)
	Global.box_moved.connect(_on_box_moved)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# print(get_case_color(player.position))
	pass

var current_color : CaseColor = CaseColor.NULL
var count_color := 0
func _on_player_moved(_direction, player_position):
	var player_int_pos := local_to_map(player_position);
	var color := get_case_color(player_int_pos)
	if color == CaseColor.GREEN:
		Global.kill_player.emit(Global.DeathReason.GREEN_GROUND)
		
	if color == current_color:
		count_color += 1;
	else:
		count_color = 1;
	current_color = color

	if count_color >= 4+1:
		Global.kill_player.emit(Global.DeathReason.FIVE_MOVEMENTS_SAME_COLOR)

var list_blue_case_already_occupied : Array[Vector2i] = []
func _on_box_moved(box: Box):
	print("BOX MOVED")
	var box_int_pos := local_to_map(box.position);
	var color := get_case_color(box_int_pos)
	if color == CaseColor.BLUE and not box_int_pos in list_blue_case_already_occupied:
		box.drown()
		list_blue_case_already_occupied.append(box_int_pos)
