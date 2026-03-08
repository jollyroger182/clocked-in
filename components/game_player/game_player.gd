extends Node2D
class_name GamePlayer

@export var event_source: EventSource
@export var audio: AudioStream:
	set(value):
		audio = value
		if conductor:
			conductor.audio = value

@onready var clock := $Clock
@onready var hands := $Clock/Hands
@onready var conductor: Conductor = $Conductor


func _ready() -> void:
	conductor.audio = audio
	hands.set_event_source(event_source)
	event_source.event.connect(print)


func _process(_delta: float) -> void:
	pass


func play() -> void:
	conductor.unpause()
