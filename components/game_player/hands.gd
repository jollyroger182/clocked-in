extends Node2D

const Hand = preload("res://components/game_player/hand/hand.tscn")

@export var event_source: EventSource
@export var conductor: Conductor

var hand_map: Dictionary[int, Node2D] = {}


func _ready() -> void:
	event_source.add_hand.connect(_on_add_hand)


func _on_add_hand(data: Dictionary) -> void:
	var node = Hand.instantiate()
	
	node.id = data["id"]
	node.beat = data["beat"]
	node.interval = data["interval"]
	node.ticks = data["ticks"]
	node.stride = data["stride"]
	if data.has("initial"):
		node.initial = data["initial"]
	if data.has("color"):
		node.color = Color(data["color"])
	if data.has("length"):
		node.length = data["length"]
	
	node.destroy.connect(func (): hand_map.erase(data["id"]))
	node.conductor = conductor
	add_child(node)
	
	hand_map[data["id"]] = node
