extends Node
class_name EventSource

signal event(data: Dictionary)

signal set_background(data: Dictionary)
signal add_hand(data: Dictionary)
signal set_props(data: Dictionary)


func _init() -> void:
	event.connect(_emit_event)


func _emit_event(data: Dictionary):
	emit_signal(data["type"], data)
