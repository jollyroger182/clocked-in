extends Node

const LEVELS = [
	"res://levels/calibration"
]


func get_level_metadata(path: String):
	var contents
	if path in LEVELS:
		contents = FileAccess.get_file_as_bytes(path + "/level.json")
	else:
		var reader = ZIPReader.new()
		var err = reader.open(path)
		if err:
			return {}
		contents = reader.read_file("level.json")
		reader.close()
	var level = JSON.parse_string(contents.get_string_from_utf8())
	return level["metadata"]


func load_level(path: String):
	if DirAccess.dir_exists_absolute("user://level"):
		Utils.delete_folder_recursive("user://level")
	elif FileAccess.file_exists("user://level"):
		DirAccess.remove_absolute("user://level")
	
	DirAccess.make_dir_recursive_absolute("user://level")
	
	if path in LEVELS:
		Utils.copy_tree(path, "user://level")
	else:
		var reader = ZIPReader.new()
		reader.open(path)
		Utils.unzip(reader, "user://level")
		reader.close()
