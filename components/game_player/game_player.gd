extends Node2D
class_name GamePlayer

@export var level: Dictionary
@export var audio: AudioStream:
	set(value):
		audio = value
		if conductor:
			conductor.audio = value

@onready var clock = $Clock
@onready var hands = $Clock/Hands
@onready var notes = $Clock/Notes
@onready var conductor = $Conductor
@onready var event_source = $EventSource


func _ready() -> void:
	conductor.audio = audio
	event_source.event.connect(print)


func play() -> void:
	# only set events here to prevent firing early
	event_source.events = level["events"]
	notes.notes = level["events"].filter(func (evt): return evt["type"] == "note")
	conductor.unpause()
