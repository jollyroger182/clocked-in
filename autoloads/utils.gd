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


func copy_tree(src: String, dst: String) -> Error:
	var dir = DirAccess.open(src)
	if not dir:
		return DirAccess.get_open_error()
	
	dir.list_dir_begin()
	
	var filename = dir.get_next()
	while filename != "":
		if filename == "." or filename == "..":
			filename = dir.get_next()
			continue
		
		var src_path = src + "/" + filename
		var dst_path = dst + "/" + filename
		if dir.current_is_dir():
			copy_tree(src_path, dst_path)
		else:
			var contents = FileAccess.get_file_as_bytes(src_path)
			var new_file = FileAccess.open(dst_path, FileAccess.WRITE)
			new_file.store_buffer(contents)
			new_file.close()
		filename = dir.get_next()
	
	return OK


func draw_sector(node: CanvasItem, center: Vector2, radius: float, start_angle: float, end_angle: float, color: Color, steps := 32):
	var points = [center]
	for i in steps + 1:
		var t = i * 1.0 / steps
		var angle = lerpf(start_angle, end_angle, t)
		points.append(center + Vector2.from_angle(angle) * radius)
	node.draw_colored_polygon(points, color)
