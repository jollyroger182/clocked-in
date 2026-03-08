extends Node2D

@export var beat: float = 0.0
@export var location: int = 0

@export var color: Color = Color.WHITE

@export var conductor: Conductor


func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func resolve(tier: Dictionary) -> void:
	print("resolved with tier ", tier["name"])
	queue_free()
