extends GridContainer

func _ready():
	for button in get_children():
		button.connect("pressed", self, "_on_button_pressed", [button.get_name()])

		if !button.is_disabled():
			if global.get_level_data(button.get_name(), "locked"):
				button.set_disabled(true)

func _on_button_pressed(name):
	scene_manager.change_scene("res://scenes/levels/" + str(name) + ".tscn")
	print("INFO: Load " + name)