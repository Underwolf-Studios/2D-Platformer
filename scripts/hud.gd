extends CanvasLayer

var game_paused = false

func _ready():
	global.connect("health_changed", self, "_on_global_health_changed")
	global.connect("score_changed", self, "_on_global_score_changed")
	global.connect("game_over", self, "_on_global_game_over")
	global.connect("level_finished", self, "_on_global_level_finished")

func _input(event):
	if event.is_action_pressed("pause") and !global.game_over:
		game_paused = not game_paused
		get_tree().set_pause(game_paused)
		$pause_menu.set_visible(game_paused)
		$health.set_visible(not game_paused)
		$score.set_visible(not game_paused)

func _on_global_health_changed(health):
	if health == 3:
		$"health/tex_health_1".show()
		$"health/tex_health_2".show()
		$"health/tex_health_3".show()
	elif health == 2:
		$"health/tex_health_1".show()
		$"health/tex_health_2".show()
		$"health/tex_health_3".hide()
	elif health == 1:
		$"health/tex_health_1".show()
		$"health/tex_health_2".hide()
		$"health/tex_health_3".hide()
	elif health == 0:
		$"health/tex_health_1".hide()
		$"health/tex_health_2".hide()
		$"health/tex_health_3".hide()

	print("INFO: Health HUD Updated")

func _on_global_score_changed(score):
	$"score/lbl_score".text = str(score)

func _on_global_game_over(game_over):
	if game_over:
		get_tree().set_pause(true)
		$game_over_menu.show()
		$health.hide()
		$score.hide()

func _on_global_level_finished(level_finished):
	if level_finished:
		get_tree().set_pause(true)
		$level_finished_menu.show()
		$health.hide()
		$score.hide()

func _on_btn_resume_pressed():
	get_tree().set_pause(false)
	$pause_menu.hide()
	$health.show()
	$score.show()

func _on_btn_continue_pressed():
	get_tree().set_pause(false)
	global.next_level()

func _on_btn_restart_pressed():
	get_tree().set_pause(false)
	$game_over_menu.hide()
#	scene_manager.change_scene(str(get_tree().get_current_scene()))
	get_tree().reload_current_scene()
	global.health = global.MAX_HEALTH
	global.game_over = false

func _on_btn_menu_pressed():
	get_tree().set_pause(false)
	scene_manager.change_scene(scene_manager.MAIN_MENU)

func _on_btn_quit_pressed():
	get_tree().quit()