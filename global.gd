extends Node

# Ici on mets des trucs globaux.
# Accessible via : Globals.


signal box_moved(box: Box);
signal naration_label;
signal test_crepiere;

var current_level : int = 0
var last_direction : Direction = Direction.NONE
var direction_counter : int = 0
var movement_counter : int = 0
var kill_counter : int = 0
var crouched : bool = false

var already_sent_message : Array[DeathReason] = []; # Stocker les messages déjà envoyés

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
	await get_tree().create_timer(1.0).timeout
	current_level += 1
	init_player_state()
	print("Le nouveau current_level : ")
	print(current_level)
	assert(current_level < levels.size(), "Bro there is no next level, pls stop")
	get_tree().change_scene_to_file(levels[current_level]);

func init_player_state():
	last_direction = Direction.NONE
	direction_counter = 0
	movement_counter = 0
	crouched = false

# Structure de données custom mais globals :

enum Direction {LEFT, RIGHT, UP, DOWN, NONE};

enum DeathReason {
	FIVE_MOVEMENTS_SAME_DIRECTION,
	TWENTY_FIVE_MOVEMENTS,
	GREEN_GROUND,
	FIVE_MOVEMENTS_SAME_COLOR,
	CREPIERE_BROKEN,
	UNKNOWN,
	CROUCH_CREPIERE_OFF,
	
	NARATION_INTRO_LEVEL_1,
	NARATION_DEATH_LEVEL_1,
	NARATION_CREPIERE_LEVEL_2,
	NARATION_INTRO_LEVEL_4,
	NARATION_DEATH_LEVEL_4,
	NARATION_CRATE_BROKEN,
};

signal player_moved;

func _on_player_moved(direction, _player_position):
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
	restart_level()

# Signal pour le changement de crouch
signal toggle_crouch_player;

func _on_toggle_crouch_player():
	crouched = !crouched
	print("Crouch état : " + str(crouched))
	if crouched:
		test_crepiere.emit()

func restart_level():
	get_tree().reload_current_scene()
	
# Gestion des niveaux
var levels = [
	"res://scenes/Niveaux/niveau1.tscn",
	"res://scenes/Niveaux/niveau2.tscn",
	"res://scenes/Niveaux/niveau3.tscn",
	"res://scenes/Niveaux/niveau4.tscn",
	"res://scenes/Niveaux/niveau10.tscn",
	"res://scenes/Niveaux/niveau11.tscn",
	"res://scenes/Niveaux/niveau12.tscn",
	"res://scenes/Niveaux/niveau13.tscn",
	"res://scenes/Niveaux/niveau14.tscn",
	"res://scenes/Niveaux/niveau20.tscn",
	"res://scenes/Niveaux/niveau21.tscn",
	"res://scenes/Niveaux/niveau22.tscn",
	"res://scenes/Niveaux/niveau23.tscn",
	"res://scenes/Niveaux/niveau24.tscn",
	"res://scenes/Niveaux/niveau30.tscn",
]
