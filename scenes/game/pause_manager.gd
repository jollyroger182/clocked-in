extends Node
class_name PauseManager

@export var player: GamePlayer
@onready var conductor := player.conductor
@export var pause_menu: Control


func pause():
	pause_menu.show()
	conductor.pause()
	get_tree().paused = true


func resume():
	get_tree().paused = false
	conductor.unpause()
	pause_menu.hide()
