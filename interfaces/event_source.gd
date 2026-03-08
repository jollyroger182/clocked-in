extends Node
class_name EventSource

@export var events: Array

@export var conductor: Conductor

signal event(data: Dictionary)

signal set_background(data: Dictionary)
signal add_hand(data: Dictionary)
signal set_props(data: Dictionary)

var _event_index = 0


func _init() -> void:
	events.sort_custom(func(a, b): return a["beat"] < b["beat"])
	event.connect(_emit_event)


func _process(_delta: float) -> void:
	if not conductor.playing:
		return
	while _event_index < events.size():
		var evt = events[_event_index]
		if evt["beat"] > conductor.beat:
			break
		event.emit(evt)
		_event_index += 1


func _emit_event(data: Dictionary):
	emit_signal(data["type"], data)
