extends Control


func _on_play_pressed() -> void:
	SceneManager.change_scene("level_menu")


func _on_level_editor_pressed() -> void:
	SceneManager.change_scene("level_editor")


func _on_quit_pressed() -> void:
	get_tree().quit()
