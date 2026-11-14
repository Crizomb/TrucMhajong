extends Label

@onready var audio_template : AudioStreamPlayer2D = $template


@onready var naration_dict : Dictionary[Global.DeathReason, Array] = {
	Global.DeathReason.FIVE_MOVEMENTS_SAME_DIRECTION : ["Tu es mort de cause inconnue...", audio_template],
	Global.DeathReason.TWENTY_FIVE_MOVEMENTS : ["Tu bouges trop...", audio_template],
	Global.DeathReason.GREEN_GROUND : ["Tu es mort de cause inconnue...", audio_template],
	Global.DeathReason.FIVE_MOVEMENTS_SAME_COLOR : ["Tu es mort de cause inconnue...", audio_template],
	Global.DeathReason.CREPIERE_BROKEN : ["Tu es mort de cause inconnue...", audio_template],
	Global.DeathReason.UNKNOWN : ["Tu es mort de cause inconnue...", audio_template],
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = ""
	visible = false
	Global.naration_label.connect(_on_naration_label)


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func show_text(s: String, time: float):
	text = s
	visible = true
	await get_tree().create_timer(time).timeout
	visible = false

func _on_naration_label(t : Global.DeathReason):
	var metadata = naration_dict.get(t, naration_dict[Global.DeathReason.UNKNOWN])
	var audio = metadata[1]
	if audio:
		audio.play()
	else:
		("No audio for this death")
	show_text(metadata[0], 3)
