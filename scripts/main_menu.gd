extends CanvasLayer

func _on_btn_resume_pressed():
	print("INFO: Resume Game")

func _on_btn_new_game_pressed():
	scene_manager.change_scene(scene_manager.LEVEL_1)
	print("INFO: New Game")

func _on_btn_levels_pressed():
	print("INFO: Open Levels")

func _on_btn_settings_pressed():
	print("INFO: Open Settings")

func _on_btn_quit_pressed():
	get_tree().quit()