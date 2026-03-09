extends Node2D

const Verdict = preload("res://components/game_player/verdict/verdict.tscn")

var sector_color = Color("#c9a227")

@export var beat: float = 0.0
@export var location: int = 0

@export var color: Color = Color.WHITE
@export var hands: Array[int] = []

@export var hands_manager: Node2D
@export var conductor: Conductor

var _no_draw := false


func _ready() -> void:
	if hands.is_empty():
		set_process(false)


func _process(_delta: float) -> void:
	if hands.is_empty():
		return
	
	var beatdiff = conductor.beat - beat
	
	if beatdiff > 0:
		self_modulate.a = 0.5
	elif beatdiff > -0.5:
		var opacity = remap(beatdiff, -0.5, 0, 0.1, 0.3)
		self_modulate.a = opacity
	elif beatdiff > -2:
		self_modulate.a = remap(beatdiff, -2, -0.5, 0, 0.1)
	
	if beatdiff > -2:
		print("beatdiff ", beatdiff, " modulate.a ", self_modulate.a)
		queue_redraw()
	
	if _no_draw:
		set_process(false)


func _draw() -> void:
	if _no_draw:
		return
	if not hands.is_empty():
		var nodes = [hands_manager.hand_map.get(hands[0]), hands_manager.hand_map.get(hands[1])]
		print(nodes)
		if nodes[0] and nodes[1]:
			var speed1: float = nodes[0].stride * 1.0 / nodes[0].interval
			var speed2: float = nodes[1].stride * 1.0 / nodes[1].interval
			var start_angle: float = nodes[0].rotation if speed1 > speed2 else nodes[1].rotation
			var end_angle: float = nodes[1].rotation if speed1 > speed2 else nodes[0].rotation
			if end_angle < start_angle:
				end_angle += TAU
			Utils.draw_sector(self, Vector2.ZERO, 100, start_angle, end_angle, sector_color)


func resolve(tier: Dictionary, diff: float) -> void:
	print("resolved with tier ", tier["name"], " at ", diff)
	
	_no_draw = true
	
	var verdict = Verdict.instantiate()
	verdict.tier = tier
	verdict.offset = diff
	verdict.finished.connect(queue_free)
	add_child(verdict)
