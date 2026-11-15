extends Control

@onready var audio_template : AudioStreamPlayer2D = $template

@onready var button: Button = $Button

@onready var naration_dict : Dictionary[Global.DeathReason, Array] = {
	Global.DeathReason.FIVE_MOVEMENTS_SAME_DIRECTION : ["\"Pénalité pour déplacements répétitifs\"", audio_template],
	Global.DeathReason.TWENTY_FIVE_MOVEMENTS : ["\"Pénalité pour excès de déplacements\"", audio_template],
	Global.DeathReason.GREEN_GROUND : ["\"Pénalité parce que j'aime pas le vert\"", audio_template],
	Global.DeathReason.FIVE_MOVEMENTS_SAME_COLOR : ["\"Pénalité pour usage abusif d'une même couleur\"", audio_template],
	Global.DeathReason.CREPIERE_BROKEN : ["\"Pénalité parce que t'as cassé ma crépière\"", audio_template],
	Global.DeathReason.UNKNOWN : ["\"Je devais dire un truc mais jsp quoi...\"", audio_template],
	Global.DeathReason.CROUCH_CREPIERE_OFF : ["\"Les crêpière ne sont pas toujours allumées tu sais\"", audio_template],

	Global.DeathReason.FIVE_DEATHS_LEVEL_4 : ["\"Il est parfois sage de retourner sur ses pas\"", audio_template],
	Global.DeathReason.OPTIONS_MENU : ["\"Ta seule option est de jouer\"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_1 : ["\"Tu es une crêpe, et tu veux cuire. Comment ça tu ne ressembles pas à une crêpe, vas y appuie sur shift sur la crêpière  !\"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_2 : ["\"Le bouton... il sert à.... je sais plus t'as qu'à essayer toi !\"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_3 : ["\"Un peu plus de travail n'a jamais fait de mal à quiconque \"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_4 : ["\"Ah enfin un peu de challenge, la vie ne peut pas tout t'offrir sur un plateau d'argent !\"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_10 : ["\"Un grand classique, rien de très compliqué au final !\"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_11 : ["\"Je préfère les damiers... mais on fera avec\"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_12 : ["\"What's 9 + 10 ?\"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_13 : ["\"Le vert... On peut l'atteindre ? \"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_14 : ["\"On peut toujours faire confiance aux cases bleues\"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_20 : ["\"Moi j'ai trouvé la solution !\"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_21 : ["\"Une petite crêpe sur la plage, ça rappelle les vacances !\"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_22 : ["\"C'est donc ça la diagonale du rouge !\"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_23 : ["\"J'ai trouvé plusieurs solutions moi !\"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_24 : ["\"Qui a mis toutes les boites ici ? \"", audio_template],
	Global.DeathReason.NARATION_INTRO_LEVEL_30 : ["\"Pas assez de boites à mon goût\"", audio_template],
	Global.DeathReason.NARATION_END_LEVEL_30 : ["\"Ouah... ça fait beaucoup de crêpes, j'ai plus faim moi !\"", audio_template],
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("label is ready")
	button.text = "non vide"
	button.visible = false
	Global.naration_label.connect(_on_naration_label)

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

func _on_naration_label(t : Global.DeathReason):
	var metadata = naration_dict.get(t, naration_dict[Global.DeathReason.UNKNOWN])
	var audio = metadata[1]
	if audio:
		audio.play()
	else:
		print("No audio for this death")
	show_text(metadata[0], 3)
