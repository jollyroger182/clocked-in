extends AudioStreamPlayer
class_name Conductor

@export var audio: AudioStream:
	set(value):
		audio = value
		stream = value
		audio_updated.emit(value)

@export var bpm: float = 120.0
@export var offset: float = 0.0

signal audio_updated(audio: AudioStream)

var position: float = 0.0
var beat: float = 0.0


func pause():
	if playing:
		stream_paused = true


func unpause():
	if stream_paused:
		stream_paused = false
	elif not playing:
		play()
		position = get_playback_position()
		beat = time_to_beat(position)


func _process(_delta: float) -> void:
	position = get_playback_position()
	beat = time_to_beat(position)



func time_to_beat(time: float) -> float:
	return (time - offset) * bpm / 60


func beat_to_time(beat: float) -> float:
	return beat * 60 / bpm + offset
