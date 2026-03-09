extends Node2D

const Note = preload("res://components/game_player/note/note.tscn")

## Array of events with "type": "note".
@export var notes: Array:
	set(value):
		notes = value
		_update_notes()

@export var hands: Node2D
@export var conductor: Conductor
@export var input_handler: InputHandler

var _note_nodes := []
var _note_index := 0


func _ready() -> void:
	input_handler.hit.connect(_on_hit)


func _process(_delta: float) -> void:
	while _note_index < _note_nodes.size():
		var note = _note_nodes[_note_index]
		var diff = conductor.position - conductor.beat_to_time(note.beat)
		if diff > Constants.TIERS[-1]["threshold"]:
			note.resolve(Constants.MISS_TIER, diff)
			# TODO: track score etc
			_note_index += 1
		else:
			break


func _on_hit() -> void:
	if _note_index >= _note_nodes.size():
		return
	var note = _note_nodes[_note_index]
	var diff = conductor.position - conductor.beat_to_time(note.beat)
	for tier in Constants.TIERS:
		if absf(diff) <= tier["threshold"]:
			note.resolve(tier, diff)
			# TODO: track score etc
			_note_index += 1
			break


func _update_notes() -> void:
	for node in _note_nodes:
		node.queue_free()
	
	_note_nodes = []
	_note_index = 0
	
	for note in notes:
		var node = Note.instantiate()
		node.beat = note["beat"]
		node.location = note["location"]
		if note.has("color"):
			node.color = note["color"]
		if note.has("hands") and note["hands"].size() == 2:
			var hands_int: Array[int] = []
			hands_int.assign(note["hands"])
			node.hands = hands_int
		node.hands_manager = hands
		node.conductor = conductor
		add_child(node)
		_note_nodes.append(node)
