extends Node

# Ici on mets des trucs globaux.
# Accessible via : Globals.

# Exemples variable globale
signal naration_label;

var current_level : int = 0
var last_direction : Direction = Direction.NONE
var direction_counter : int = 0
var movement_counter : int = 0
var kill_counter : int = 0
var crouched : bool = false
# Et exemple d'accès dans entities/super_label_moche_test/label_moche.gd

# Exemple signal global
# Et exemple d'utilisation de ce signal dans entities/super_label_moche_test/label_moche.gd
signal change_level;

func _ready():
	change_level.connect(_on_change_level)
	kill_player.connect(_on_kill_player)
	player_moved.connect(_on_player_moved)
	toggle_crouch_player.connect(_on_toggle_crouch_player)
	init_player_state()

func _on_change_level():
	current_level += 1
	print("Le nouveau current_level : ")
	print(current_level)

func init_player_state():
	last_direction = Direction.NONE
	direction_counter = 0
	movement_counter = 0
	crouched = false

# Structure de données custom mais globals :

enum Direction {LEFT, RIGHT, UP, DOWN, NONE};

enum DeathReason {
	UNKNOWN,
	FIVE_MOVEMENTS_SAME_DIRECTION,
	TWENTY_FIVE_MOVEMENTS,
	GREEN_GROUND,
	FIVE_MOVEMENTS_SAME_COLOR,
	CREPIERE_BROKEN
};

signal player_moved;

func _on_player_moved(direction, position):
	movement_counter += 1
	if movement_counter >= 24+1:
		kill_player.emit(DeathReason.TWENTY_FIVE_MOVEMENTS)
		return
	
	if direction != last_direction:
		direction_counter = 1
	else:
		direction_counter += 1
		if direction_counter >= 4+1:
			kill_player.emit(DeathReason.FIVE_MOVEMENTS_SAME_DIRECTION)
			return
	last_direction = direction

# Signal pour tuer le joueur
signal kill_player;

func _on_kill_player(reason : DeathReason):
	print("Le joueur est mort : " + str(reason))
	naration_label.emit(reason)
	init_player_state()
	kill_counter += 1

# Signal pour le changement de crouch
signal toggle_crouch_player;

func _on_toggle_crouch_player():
	crouched = !crouched
	print("Crouch état : " + str(crouched))
