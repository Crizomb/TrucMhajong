extends Node

# Ici on mets des trucs globaux.
# Accessible via : Globals.

signal box_moved(box: Box);
signal naration_label;
signal test_crepiere;

signal switch_to_menu;
signal switch_to_gameplay;

var current_level : int = 0
var last_direction : Direction = Direction.NONE
var direction_counter : int = 0
var movement_counter : int = 0
var kill_counter : int = 0
var crouched : bool = false
var s : String = ""
var time : int = 3

var reasons_counters : Array[int] = []; # Stocker les messages déjà envoyés
# Et exemple d'accès dans entities/super_label_moche_test/label_moche.gd

# Exemple signal global
# Et exemple d'utilisation de ce signal dans entities/super_label_moche_test/label_moche.gd
signal change_level;

func _ready():
	reset_message_counters()
	change_level.connect(_on_change_level)
	kill_player.connect(_on_kill_player)
	player_moved.connect(_on_player_moved)
	toggle_crouch_player.connect(_on_toggle_crouch_player)
	init_player_state()

func try_message(r : DeathReason, m : int):
	if reasons_counters[r] % m == 0:
		naration_label.emit(r)
	reasons_counters[r] += 1

func _on_change_level():
	await get_tree().create_timer(1.0).timeout
	current_level += 1
	init_player_state()
	print("Le nouveau current_level : " + str(current_level))
	assert(current_level < levels.size(), "Bro there is no next level, pls stop")
	
	# envoyer un message d'intro (c'est dégueulasse je sais)
	match current_level:
		0: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_1, 610/2) # Très haut modulo pour ne le faire qu'une fois
		1: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_2, 610/2)
		2: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_3, 610/2)
		3: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_4, 610/2)
		4: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_10, 610/2)
		(4+1): try_message(Global.DeathReason.NARATION_INTRO_LEVEL_11, 610/2)
		6: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_12, 610/2)
		7: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_13, 610/2)
		8: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_14, 610/2)
		9: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_20, 610/2)
		10: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_21, 610/2)
		11: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_22, 610/2)
		12: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_23, 610/2)
		13: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_24, 610/2)
		14: try_message(Global.DeathReason.NARATION_INTRO_LEVEL_30, 610/2)
		_: pass
	
	get_tree().change_scene_to_file(levels[current_level]);

func init_player_state():
	last_direction = Direction.NONE
	direction_counter = 0
	movement_counter = 0
	crouched = false

func reset_message_counters():
	reasons_counters.resize(DeathReason.size());
	reasons_counters.fill(0);

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
	
	FIVE_DEATHS_LEVEL_4,
	OPTIONS_MENU,
	NARATION_INTRO_LEVEL_1,
	NARATION_INTRO_LEVEL_2,
	NARATION_INTRO_LEVEL_3,
	NARATION_INTRO_LEVEL_4,
	NARATION_INTRO_LEVEL_10,
	NARATION_INTRO_LEVEL_11,
	NARATION_INTRO_LEVEL_12,
	NARATION_INTRO_LEVEL_13,
	NARATION_INTRO_LEVEL_14,
	NARATION_INTRO_LEVEL_20,
	NARATION_INTRO_LEVEL_21,
	NARATION_INTRO_LEVEL_22,
	NARATION_INTRO_LEVEL_23,
	NARATION_INTRO_LEVEL_24,
	NARATION_INTRO_LEVEL_30,
	NARATION_END_LEVEL_30,
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
	try_message(reason, 5) # envoyer le message de mort toutes les 5 morts
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
	get_tree().reload_current_scene.call_deferred()

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
