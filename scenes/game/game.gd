extends Node2D

@export var player: GamePlayer

var level: Dictionary
var audio: AudioStream


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level = JSON.parse_string(FileAccess.get_file_as_string("user://level/level.json"))
	audio = AudioStreamWAV.load_from_file("user://level/music.wav")
	
	player.level = level
	player.audio = audio
	player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
