extends CanvasLayer

func _ready():
	settings.load_settings()

func _on_btn_resume_pressed():
	global.resume_game()

func _on_btn_new_game_pressed():
	global.new_game()

func _on_btn_levels_pressed():
	$levels_menu.show()

func _on_btn_settings_pressed():
	$settings_menu.show()

func _on_btn_quit_pressed():
	get_tree().quit()

func _on_btn_back_pressed():
	if $settings_menu.is_visible() == true:
		settings.load_settings()
		$settings_menu.hide()
	elif $levels_menu.is_visible() == true:
		$levels_menu.hide()
	else:
		return