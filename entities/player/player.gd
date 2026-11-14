extends Area2D
class_name Player

@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@export var TileSize := 16
@onready var sfx_movement: AudioStreamPlayer2D = $sfx_movement

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

func toggle_crouch_if_pressed():
	if Input.is_action_just_pressed("ToggleCrouch"):
		Global.toggle_crouch_player.emit()

func _process(delta: float) -> void:
	var direction := get_direction_input()
	move_direction(direction)
	toggle_crouch_if_pressed()

func move_direction(direction: Global.Direction):
	var moved : bool = false
	
	match direction:
		Global.Direction.RIGHT:
			var collider : Object = ray_cast_right.get_collider()
			if !collider or (collider.is_in_group("box") and collider.go_right()):
				position.x += TileSize
				moved = true
		
		Global.Direction.LEFT:
			var collider : Object = ray_cast_left.get_collider()
			if !collider or (collider.is_in_group("box") and collider.go_left()):
				position.x -= TileSize
				moved = true
				
		Global.Direction.UP:
			var collider : Object = ray_cast_up.get_collider()
			if !collider or (collider.is_in_group("box") and collider.go_up()):
				position.y -= TileSize
				moved = true
				
		Global.Direction.DOWN:
			var collider : Object = ray_cast_down.get_collider()
			if !collider or (collider.is_in_group("box") and collider.go_down()):
				position.y += TileSize
				moved = true
		
		Global.Direction.NONE:
			pass

	if moved:
		Global.player_moved.emit(direction, position)
		sfx_movement.pitch_scale = 1 + log(max(Global.direction_counter+1, 1))
		sfx_movement.play()
