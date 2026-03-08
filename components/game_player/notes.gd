extends Node2D

const Note = preload("res://components/game_player/note/note.tscn")

## Array of events with "type": "note".
@export var notes: Array:
	set(value):
		notes = value
		_update_notes()

@export var conductor: Conductor
@export var input_handler: InputHandler

var _note_nodes := []
var _note_index := 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_handler.hit.connect(_on_hit)


func _on_hit() -> void:
	if _note_index >= _note_nodes.size():
		return
	var note = _note_nodes[_note_index]
	var diff = (conductor.beat - note.beat)
	print("hit at ", diff)
	note.resolve(Constants.V_HIT)
	_note_index += 1


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
		node.conductor = conductor
		add_child(node)
		_note_nodes.append(node)
