extends Control

const LevelItem = preload("res://scenes/level_menu/level_item/level_item.tscn")

@export var items_container: Container


func _ready() -> void:
	for path in LevelLoader.LEVELS:
		var metadata = LevelLoader.get_level_metadata(path)
		
		var node = LevelItem.instantiate()
		node.title = metadata["title"]
		node.musician = metadata["musician"]
		node.charter = metadata["charter"]
		node.cover_artist = metadata["cover_artist"]
		node.play.connect(func(): _on_play(path))
		items_container.add_child(node)


func _on_play(path: String) -> void:
	print("playing ", path)
	
	LevelLoader.load_level(path)
	SceneManager.change_scene("game")
