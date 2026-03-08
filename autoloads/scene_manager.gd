extends Node

const SCENES = {
	"main_menu": "res://scenes/main_menu/main_menu.tscn",
	"level_menu": "res://scenes/level_menu/level_menu.tscn",
	"level_editor": "res://scenes/level_editor/level_editor.tscn",
	"game": "res://scenes/game/game.tscn"
}


func change_scene(scene: String):
	get_tree().change_scene_to_file(SCENES[scene])
