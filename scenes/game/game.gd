extends Node2D

@export var player: GamePlayer
@export var pause_manager: PauseManager

var level: Dictionary
var audio: AudioStream


func _ready() -> void:
	level = JSON.parse_string(FileAccess.get_file_as_string("user://level/level.json"))
	audio = AudioStreamWAV.load_from_file("user://level/music.wav")
	
	player.level = level
	player.audio = audio
	player.play()


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		print("pause?")
		pause_manager.pause()
