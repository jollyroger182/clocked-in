extends Node2D

@export var beat: float = 0.0
@export var interval: float = 1.0
@export var ticks: int = 7
@export var stride: int = 5

@export var initial: int = 0
@export var color: Color = Color.WHITE
@export var length: float = 0.8

@export var conductor: Conductor

var _position := 0
var _last_tick_beat := 0.0
var _ticks_remaining := 0


func _ready() -> void:
	_position = initial
	_last_tick_beat = beat
	_ticks_remaining = ticks
	_update_rotation()


func _draw() -> void:
	draw_line(Vector2.ZERO, Vector2.RIGHT * Constants.CLOCK_RADIUS * length, color, 2, true)


func _process(_delta: float) -> void:
	var next_tick_beat = _last_tick_beat + interval
	if conductor.beat >= next_tick_beat:
		_tick()


func _tick() -> void:
	if _ticks_remaining <= 0:
		queue_free()
		return
	_position += stride
	_last_tick_beat += interval
	_ticks_remaining -= 1
	_update_rotation()


func _update_rotation() -> void:
	rotation_degrees = 6 * _position - 90
