extends Label

@onready var audio_template : AudioStreamPlayer2D = $template


@onready var naration_dict : Dictionary[Global.DeathReason, Array] = {
	Global.DeathReason.UNKNOWN : ["Tu es mort de cause inconnue...", audio_template],
	Global.DeathReason.TWENTY_FIVE_MOVEMENTS : ["Tu bouges trop...", audio_template],
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

func _on_naration_label(t : Global.DeathReason):
	var metadata = naration_dict.get(t, naration_dict[Global.DeathReason.UNKNOWN])
	text = metadata[0]
	print(metadata)
	var audio = metadata[1]
	if audio:
		audio.play()
	else:
		print("No audio for this death")
