extends StaticBody2D;

@onready var RayCastRight : RayCast2D = $RayCastRight;
@onready var RayCastDown : RayCast2D = $RayCastDown;
@onready var RayCastUp : RayCast2D = $RayCastUp;
@onready var RayCastLeft : RayCast2D = $RayCastLeft;

var box_movement := 128


func go_right() -> bool:
	var can_move := true;
	if RayCastRight.is_colliding():
		var colliding : Object = RayCastRight.get_collider();
		if colliding.is_in_group("box"):
			can_move = colliding.go_right();
		else:
			can_move = false;
	
	if can_move:
		position.x += box_movement;
	
	return can_move;


func go_left() -> bool:
	var can_move := true;
	if RayCastLeft.is_colliding():
		var colliding : Object = RayCastLeft.get_collider();
		if colliding.is_in_group("box"):
			can_move = colliding.go_left();
		else:
			can_move = false;
	
	if can_move:
		position.x -= box_movement;
	
	return can_move;
	
func go_up() -> bool:
	var can_move := true;
	if RayCastUp.is_colliding():
		var colliding : Object = RayCastUp.get_collider();
		if colliding.is_in_group("box"):
			can_move = colliding.go_up();
		else:
			can_move = false;
	
	if can_move:
		position.y -= box_movement;
	
	return can_move;
	
func go_down() -> bool:
	var can_move := true;
	if RayCastDown.is_colliding():
		var colliding : Object = RayCastDown.get_collider();
		if colliding.is_in_group("box"):
			can_move = colliding.go_down();
		else:
			can_move = false;
	
	if can_move:
		position.y += box_movement;
	
	return can_move;
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
