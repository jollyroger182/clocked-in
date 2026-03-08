extends Node2D

@export var event_source: EventSource


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if event_source:
		set_event_source(event_source)


func set_event_source(source: EventSource) -> void:
	event_source = source
	event_source.add_hand.connect(_on_add_hand)


func _on_add_hand(data: Dictionary) -> void:
	print("hand add ", data)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
