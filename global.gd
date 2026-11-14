extends Node

# Ici on mets des trucs globaux.
# Accessible via : Globals.

# Exemples variable globale

var current_level : int = 0
var last_direction : Direction = Direction.NONE
var direction_counter : int = 0
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

func _on_change_level():
	current_level += 1
	print("Le nouveau current_level : ")
	print(current_level)

# Structure de données custom mais globals :

enum Direction {LEFT, RIGHT, UP, DOWN, NONE};

signal player_moved;

func _on_player_moved(direction):
	if direction != last_direction:
		direction_counter = 1
	else:
		direction_counter += 1
		if direction_counter == 5:
			kill_player.emit()
			return
	last_direction = direction

# Signal pour tuer le joueur
signal kill_player;

func _on_kill_player():
	print("Le joueur est mort")
	last_direction = Direction.NONE
	direction_counter = 0
	kill_counter += 1
	crouched = false

# Signal pour le changement de crouch
signal toggle_crouch_player;

func _on_toggle_crouch_player():
	crouched = !crouched
	print("Crouch état : " + str(crouched))
