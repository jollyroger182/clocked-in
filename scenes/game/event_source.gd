extends EventSource
class_name GameEventSource

@export var player: GamePlayer

@export var events: Array = []

@onready var conductor := player.conductor


func set_events(new_events: Array):
	events = new_events.duplicate()


func _process(_delta: float) -> void:
	var to_delete = 0
	for evt in events:
		var bar = evt["bar"]
		if conductor.bar < bar:
			break
		if conductor.bar == bar and conductor.bar_beat < evt.get("beat", 1):
			break
		event.emit(evt)
		to_delete += 1
	if to_delete:
		events = events.slice(to_delete)
