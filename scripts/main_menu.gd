extends CanvasLayer

func _on_btn_resume_pressed():
	print("INFO: Resume Game")

func _on_btn_new_game_pressed():
	scene_manager.change_scene(scene_manager.LEVEL_1)

func _on_btn_levels_pressed():
	$levels_menu.show()

func _on_btn_settings_pressed():
	$settings_menu.show()

func _on_btn_quit_pressed():
	get_tree().quit()

func _on_btn_back_pressed():
	if $settings_menu.is_visible() == true:
		$settings_menu.hide()
	elif $levels_menu.is_visible() == true:
		$levels_menu.hide()
	else:
		return