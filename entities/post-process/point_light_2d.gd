extends CanvasLayer

@onready var texture_rect: TextureRect = $TextureRect

var noise_texture: NoiseTexture2D
var fast_noise: FastNoiseLite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	noise_texture = texture_rect.texture
	fast_noise = noise_texture.noise


func _on_timer_timeout() -> void:
	fast_noise.seed += 1
