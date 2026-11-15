extends Node

@onready var intro_menu: AudioStreamPlayer = $IntroMenu
@onready var loop_menu: AudioStreamPlayer = $LoopMenu
@onready var intro_level: AudioStreamPlayer = $IntroLevel
@onready var loop_level: AudioStreamPlayer = $LoopLevel


func play_intro_music():
	loop_level.stop()
	intro_level.stop()
	if intro_menu.playing or loop_menu.playing:
		return
	
	intro_menu.play()
	intro_menu.finished.connect(_start_loop_menu)

func _start_loop_menu():
	loop_menu.play()
	
func play_level_music():
	loop_menu.stop()
	intro_menu.stop()
	if loop_level.playing or intro_level.playing:
		return
	
	intro_level.play()
	intro_level.finished.connect(_start_loop_level)

func _start_loop_level():
	loop_level.play()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
