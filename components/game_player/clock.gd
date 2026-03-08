extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _draw() -> void:
	var radius = Constants.CLOCK_RADIUS
	draw_circle(Vector2.ZERO, radius, Color.WHITE, false, 3, true)
	draw_circle(Vector2.ZERO, 3, Color.WHITE, true, -1, true)
	for i in 12:
		var unit = Vector2.from_angle(TAU * i / 12)
		draw_line(unit * radius, unit * (radius - 5), Color.WHITE, 2, true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
