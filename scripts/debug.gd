extends CanvasLayer

func _input(event):
	if event.is_action_pressed("debug"):
		$menu.set_visible(!$menu.is_visible())

func _on_btn_print_savegame_pressed():
	print(global.get_state())

func _on_btn_save_savegame_pressed():
	global.save_game()

func _on_btn_load_savegame_pressed():
	global.load_game()

func _on_btn_print_settings_pressed():
#	print(settings.settings)
#	print(settings.config_file.get_as_text())
	pass

func _on_btn_save_settings_pressed():
#	settings.save_settings()
	pass

func _on_btn_load_settings_pressed():
	settings.load_settings()