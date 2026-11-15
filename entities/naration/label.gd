extends Control

@onready var help_level_4 : AudioStreamPlayer2D = $help_level_4
@onready var Intro_1 : AudioStreamPlayer2D = $Intro_1
@onready var Intro_2 : AudioStreamPlayer2D = $Intro_2
@onready var Intro_3 : AudioStreamPlayer2D = $Intro_3
@onready var Intro_4 : AudioStreamPlayer2D = $Intro_4
@onready var Intro_10 : AudioStreamPlayer2D = $Intro_10
@onready var Intro_11 : AudioStreamPlayer2D = $Intro_11
@onready var Intro_13 : AudioStreamPlayer2D = $Intro_13
@onready var Intro_14 : AudioStreamPlayer2D = $Intro_14
@onready var Intro_20 : AudioStreamPlayer2D = $Intro_20
@onready var Intro_21 : AudioStreamPlayer2D = $Intro_21
@onready var Intro_22 : AudioStreamPlayer2D = $Intro_22
@onready var Intro_23 : AudioStreamPlayer2D = $Intro_23
@onready var Intro_24 : AudioStreamPlayer2D = $Intro_24
@onready var mort_5_couleurs : AudioStreamPlayer2D = $mort_5_couleurs
@onready var mort_5_dirs : AudioStreamPlayer2D = $mort_5_dirs
@onready var mort_25_mouvements : AudioStreamPlayer2D = $mort_25_mouvements
@onready var mort_crepiere_cassee : AudioStreamPlayer2D = $mort_crepiere_cassee
@onready var mort_sol_vert : AudioStreamPlayer2D = $mort_sol_vert
@onready var options : AudioStreamPlayer2D = $options

@onready var button: Button = $Button

@onready var naration_dict : Dictionary[Global.DeathReason, Array] = {
	Global.DeathReason.FIVE_MOVEMENTS_SAME_DIRECTION : ["\"Pénalité pour déplacements répétitifs\"", mort_5_dirs],
	Global.DeathReason.TWENTY_FIVE_MOVEMENTS : ["\"Pénalité pour excès de déplacements\"", mort_25_mouvements],
	Global.DeathReason.GREEN_GROUND : ["\"Pénalité parce que j'aime pas le vert\"", mort_sol_vert],
	Global.DeathReason.FIVE_MOVEMENTS_SAME_COLOR : ["\"Pénalité pour usage abusif d'une même couleur\"", mort_5_couleurs],
	Global.DeathReason.CREPIERE_BROKEN : ["\"Pénalité parce que t'as cassé ma crépière\"", mort_crepiere_cassee],
	Global.DeathReason.UNKNOWN : ["\"Je devais dire un truc mais jsp quoi...\"", null],
	Global.DeathReason.CROUCH_CREPIERE_OFF : ["\"Les crêpière ne sont pas toujours allumées tu sais\"", null],

	Global.DeathReason.FIVE_DEATHS_LEVEL_4 : ["\"Il est parfois sage de retourner sur ses pas\"", help_level_4],
	Global.DeathReason.OPTIONS_MENU : ["\"Ta seule option est de jouer\"", options],
	Global.DeathReason.NARATION_INTRO_LEVEL_1 : ["\"Tu es une crêpe, et tu veux cuire. Comment ça tu ne ressembles pas à une crêpe, vas y appuie sur shift sur la crêpière  !\"", Intro_1],
	Global.DeathReason.NARATION_INTRO_LEVEL_2 : ["\"Le bouton... il sert à.... je sais plus t'as qu'à essayer toi !\"", Intro_2],
	Global.DeathReason.NARATION_INTRO_LEVEL_3 : ["\"Un peu plus de travail n'a jamais fait de mal à quiconque \"", Intro_3],
	Global.DeathReason.NARATION_INTRO_LEVEL_4 : ["\"Ah enfin un peu de challenge, la vie ne peut pas tout t'offrir sur un plateau d'argent !\"", Intro_4],
	Global.DeathReason.NARATION_INTRO_LEVEL_10 : ["\"Un grand classique, rien de très compliqué au final !\"", Intro_10],
	Global.DeathReason.NARATION_INTRO_LEVEL_11 : ["\"Je préfère les damiers... mais on fera avec\"", Intro_11],
	Global.DeathReason.NARATION_INTRO_LEVEL_12 : ["\"What's 9 + 10 ?\"", null],
	Global.DeathReason.NARATION_INTRO_LEVEL_13 : ["\"Le vert... On peut l'atteindre ? \"", Intro_13],
	Global.DeathReason.NARATION_INTRO_LEVEL_14 : ["\"On peut toujours faire confiance aux cases bleues\"", Intro_14],
	Global.DeathReason.NARATION_INTRO_LEVEL_20 : ["\"Moi j'ai trouvé la solution !\"", Intro_20],
	Global.DeathReason.NARATION_INTRO_LEVEL_21 : ["\"Une petite crêpe sur la plage, ça rappelle les vacances !\"", Intro_21],
	Global.DeathReason.NARATION_INTRO_LEVEL_22 : ["\"C'est donc ça la diagonale du rouge !\"", Intro_22],
	Global.DeathReason.NARATION_INTRO_LEVEL_23 : ["\"J'ai trouvé plusieurs solutions moi !\"", Intro_23],
	Global.DeathReason.NARATION_INTRO_LEVEL_24 : ["\"Qui a mis toutes les boites ici ? \"", Intro_24],
	Global.DeathReason.NARATION_INTRO_LEVEL_30 : ["\"Pas assez de boites à mon goût\"", null],
	Global.DeathReason.NARATION_END_LEVEL_30 : ["\"Ouah... ça fait beaucoup de crêpes, j'ai plus faim moi !\"", null],
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.visible = false
	if Global.s != "":
		await get_tree().create_timer(0.1).timeout
		show_text(Global.s, Global.time)
	Global.s = ""
	Global.naration_label.connect(_on_naration_label)
	Global.metal_pipe.connect(_on_metal_pipe)

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func show_text(s: String, time: float):
	print("text shown")
	button.text = s
	button.visible = true
	await get_tree().create_timer(time).timeout
	button.visible = false

func _on_metal_pipe():
	options.play()

func _on_naration_label(t : Global.DeathReason):
	var metadata = naration_dict.get(t, naration_dict[Global.DeathReason.UNKNOWN])
	Global.s = metadata[0]
	Global.time = 3
	var audio = metadata[1]
	if audio:
		audio.play()
	else:
		print("No audio for this death")
	
