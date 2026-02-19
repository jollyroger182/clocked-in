extends Node

const SCENES = {
	"main_menu": "res://scenes/main_menu/main_menu.tscn"
}


func change_scene(scene: String):
	get_tree().change_scene_to_file(SCENES[scene])
