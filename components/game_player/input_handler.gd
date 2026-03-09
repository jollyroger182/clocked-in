extends Node
class_name InputHandler

signal hit


func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("hit"):
		print("hit...?")
		hit.emit()
