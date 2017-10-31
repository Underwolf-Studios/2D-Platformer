extends Panel

func _on_fullscreen_toggled(pressed):
	OS.set_window_fullscreen(pressed)