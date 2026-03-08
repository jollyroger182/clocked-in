extends Node

const LEVELS = [
	"res://levels/calibration.zip"
]


func get_level_metadata(path: String):
	var reader = ZIPReader.new()
	var err = reader.open(path)
	if err:
		return {}
	var contents = reader.read_file("level.json")
	reader.close()
	var level = JSON.parse_string(contents.get_string_from_utf8())
	return level["metadata"]
