extends Node


func delete_folder_recursive(path: String):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		
		var filename = dir.get_next()
		while filename != "":
			if filename == "." or filename == "..":
				filename = dir.get_next()
				continue
			
			var file_path = path + "/" + filename
			if dir.current_is_dir():
				delete_folder_recursive(file_path)
			else:
				DirAccess.remove_absolute(file_path)
			filename = dir.get_next()
		
		DirAccess.remove_absolute(path)


func unzip(reader: ZIPReader, folder: String):
	var files := reader.get_files()
	
	for filename in files:
		var contents := reader.read_file(filename)
		
		var extract_to := folder + "/" + filename
		DirAccess.make_dir_recursive_absolute(extract_to + "/..")
		
		var file = FileAccess.open(extract_to, FileAccess.WRITE)
		file.store_buffer(contents)
		file.close()
