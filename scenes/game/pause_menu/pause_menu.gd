extends Panel

@export var pause_manager: PauseManager


func _on_resume_pressed() -> void:
	pause_manager.resume()


func _on_restart_pressed() -> void:
	pause_manager.resume()
	get_tree().reload_current_scene()


func _on_exit_pressed() -> void:
	SceneManager.change_scene("level_menu")
