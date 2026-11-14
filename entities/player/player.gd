extends Area2D
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@export var TileSize := 16

func get_direction_input() -> Global.Direction:
	var direction : Global.Direction;
	if Input.is_action_just_pressed("Right"):
		direction = Global.Direction.RIGHT;
	elif Input.is_action_just_pressed("Down"):
		direction = Global.Direction.DOWN;
	elif Input.is_action_just_pressed("Left"):
		direction = Global.Direction.LEFT;
	elif Input.is_action_just_pressed("Up"):
		direction = Global.Direction.UP;
	else:
		direction = Global.Direction.NONE;
	
	
	return direction;

func _process(delta: float) -> void:
	var direction := get_direction_input()
	move_direction(direction)
	if direction != Global.Direction.NONE:
		Global.player_moved.emit()


func move_direction(direction: Global.Direction):
	
	match direction:
		Global.Direction.RIGHT:
			var collider : Object = ray_cast_right.get_collider()
			if !collider or (collider.is_in_group("box") and collider.go_right()):
				position.x += TileSize
		
		Global.Direction.LEFT:
			var collider : Object = ray_cast_left.get_collider()
			if !collider or (collider.is_in_group("box") and collider.go_left()):
				position.x -= TileSize
				
		Global.Direction.UP:
			var collider : Object = ray_cast_up.get_collider()
			if !collider or (collider.is_in_group("box") and collider.go_up()):
				position.y -= TileSize
				
		Global.Direction.DOWN:
			var collider : Object = ray_cast_down.get_collider()
			if !collider or (collider.is_in_group("box") and collider.go_down()):
				position.y += TileSize
		
		Global.Direction.NONE:
			pass			
