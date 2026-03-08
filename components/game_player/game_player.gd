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
@onready var conductor = $Conductor
@onready var event_source = $EventSource


func _ready() -> void:
	conductor.audio = audio
	event_source.event.connect(print)


func _process(_delta: float) -> void:
	pass


func play() -> void:
	# only set events here to prevent firing early
	event_source.events = level["events"]
	conductor.unpause()
