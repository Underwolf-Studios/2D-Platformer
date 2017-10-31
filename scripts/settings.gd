extends Panel

signal settings_loaded

const SAVE_PATH = "res://config.cfg"
var config_file = ConfigFile.new()

# Display
var fullscreen = false

func _ready():
	connect("settings_loaded", self, "_apply_settings")

func load_settings():
	var error = config_file.load(SAVE_PATH)
	if error:
		# Set Default Values if file does not exist

		# Display
		config_file.set_value("display", "fullscreen", fullscreen)

		config_file.save(SAVE_PATH)
	else:
		load_from_cfg(config_file, "display", "fullscreen")

	emit_signal("settings_loaded")
	print("INFO: Settings Loaded")

func save_to_config(section, key, value):
	var error = config_file.load(SAVE_PATH)
	if error:
		print("ERROR: Saving the settings. Error code: %s" % error)
	else:
		config_file.set_value(section, key, value)
		config_file.save(SAVE_PATH)

func load_from_cfg(config, section, key):
	if config_file.has_section_key(section, key):
		set(key, config_file.get_value(section, key))
	else:
		print("WARNING: '" + key + "' missing from '" + section + "' section in the config file, default value has been added.")
		save_to_config(section, key, get(key))

func _apply_settings():
	#Display
	OS.set_window_fullscreen(fullscreen)
#	$"settings_menu/tab_container/DISPLAY/fullscreen".set_pressed(fullscreen)

func _on_fullscreen_toggled(pressed):
	save_to_config("display", "fullscreen", pressed)