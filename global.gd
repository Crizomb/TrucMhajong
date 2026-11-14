extends Node

# Ici on mets des trucs globaux.
# Accessible via : Globals.

# Exemples variable globale

var current_level : int = 0
# Et exemple d'accès dans entities/super_label_moche_test/label_moche.gd

# Exemple signal global
signal change_level;

func _ready():
	change_level.connect(_on_change_level)

func _on_change_level():
	current_level += 1
	print("Le nouveau current_level : ")
	print(current_level)

# Et exemple d'utilisation de ce signal dans entities/super_label_moche_test/label_moche.gd
