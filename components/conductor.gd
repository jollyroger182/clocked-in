extends AudioStreamPlayer
class_name Conductor

@export var audio: AudioStream:
	set(value):
		audio = value
		stream = value
		audio_updated.emit(value)

@export var bpm: float = 120.0
@export var offset: float = 0.0
@export var beats_per_bar: int = 4

signal audio_updated(audio: AudioStream)

signal beat(beat_count: int)

var position: float = 0.0
var beat_count: int = 0

var bar := 0
var bar_beat := 0

var _last_beat_position: float = 0.0


func pause():
	if playing:
		stream_paused = true


func unpause():
	if stream_paused:
		stream_paused = false
	elif not playing:
		play()
		_last_beat_position = offset - 60 / bpm
		beat_count = 0
		bar = 1
		bar_beat = 0


func _process(_delta: float) -> void:
	position = get_playback_position()
	var next_beat = _last_beat_position + 60 / bpm
	if position >= next_beat:
		_last_beat_position += 60 / bpm
		beat_count += 1
		bar_beat += 1
		if bar_beat > beats_per_bar:
			bar += 1
			bar_beat = 1
		beat.emit(beat_count)
