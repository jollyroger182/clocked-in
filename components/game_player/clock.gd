extends Node2D


func _draw() -> void:
	var radius = Constants.CLOCK_RADIUS
	draw_circle(Vector2.ZERO, radius, Color.WHITE, false, 3, true)
	draw_circle(Vector2.ZERO, 3, Color.WHITE, true, -1, true)
	for i in 12:
		var unit = Vector2.from_angle(TAU * i / 12)
		draw_line(unit * radius, unit * (radius - 5), Color.WHITE, 2, true)
