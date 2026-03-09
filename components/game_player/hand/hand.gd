extends Node2D

@export var beat: float = 0.0
@export var id: int = 0
@export var interval: float = 1.0
@export var ticks: int = 7
@export var stride: int = 5

@export var initial: int = 0
@export var color: Color = Color.WHITE
@export var length: float = 0.8

@export var conductor: Conductor

signal destroy

var easing_beats: float:
	get:
		return interval / 4

var location := 0
var _last_tick_beat := 0.0
var _ticks_remaining := 0


func _ready() -> void:
	location = initial
	_last_tick_beat = beat
	_ticks_remaining = ticks
	_update_rotation()


func _draw() -> void:
	draw_line(Vector2.ZERO, Vector2.RIGHT * Constants.CLOCK_RADIUS * length, color, 2, true)


func _process(_delta: float) -> void:
	var next_tick_beat = _last_tick_beat + interval
	if conductor.beat >= next_tick_beat - easing_beats:
		_tick()


func _tick() -> void:
	if _ticks_remaining <= 0:
		_destroy()
		return
	location += stride
	_last_tick_beat += interval
	_ticks_remaining -= 1
	var smooth_time = conductor.beat_to_time(_last_tick_beat) - conductor.position
	_update_rotation(smooth_time)


func _update_rotation(smooth: float = 0.0) -> void:
	var new_rotation = 6 * location - 90
	if smooth:
		var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
		tween.tween_property(self, "rotation_degrees", new_rotation, smooth)
	else:
		rotation_degrees = new_rotation


func _destroy() -> void:
	destroy.emit()
	queue_free()
