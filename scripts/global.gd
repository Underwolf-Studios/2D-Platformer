extends Node

signal health_changed(health)
signal score_changed(score)
signal game_over(game_over)
signal level_finished(level_finished)

const SAVE_PATH = "res://savegame.json"

const MAX_HEALTH   = 3
var health         = 0 setget health_changed
var score          = 0 setget score_changed
var game_over      = false setget game_over
var level_finished = false setget level_finished
var current_level  = null

var levels = {
	"level_1": {
		"path": "res://scenes/levels/level_1.tscn",
		"locked": false
	},
	"level_2": {
		"path": "res://scenes/levels/level_2.tscn",
		"locked": true
	}
}

func _ready():
	add_to_group("persistent")
	health = MAX_HEALTH
	print("INFO: Health: " + str(health))

func resume_game():
	print("INFO: Resume Game")

func new_game():
	current_level = 1
	scene_manager.change_scene("res://scenes/levels/level_" + str(current_level) +".tscn")

func next_level():
	current_level += 1
	scene_manager.change_scene("res://scenes/levels/level_" + str(current_level) +".tscn")

func health_changed(new_value):
	health = new_value
	emit_signal("health_changed", health)
	print("INFO: Health: " + str(health))

func score_changed(new_value):
	score = new_value
	emit_signal("score_changed", score)
	print("INFO: Score: " + str(score))

func game_over(new_value):
	game_over = new_value
	emit_signal("game_over", game_over)
	print("INFO: Game Over: " + str(game_over))

func level_finished(new_value):
	level_finished = new_value
	emit_signal("level_finished", level_finished)
	print("INFO: Level Finished: " + str(level_finished))


# Saving and Loading Game

func save_game():
	var save_file = File.new()
	save_file.open(SAVE_PATH, File.WRITE)

	var save_dict = {}
	var nodes_to_save = get_tree().get_nodes_in_group("persistent")

	for node in nodes_to_save:
		save_dict[node.get_path()] = node.get_state()

	save_file.store_line(to_json(save_dict))
	save_file.close()

	print("INFO: Saving Game")

func load_game():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
		print("ERROR: The Save File does not exist.")
		return
	save_file.open(SAVE_PATH, File.READ)

	var data = {}
	data = parse_json(save_file.get_as_text())

	for node_path in data.keys():
		var node_data = data[node_path]
		get_node(node_path).load_state(node_data)

	print("INFO: Loading Game")

func get_state():
	var save_dict = {
		data = {
			score = score
		},
		levels = levels
	}
	return save_dict

func load_state(data):
	for attribute in data:
		if attribute  == 'data':
			score = (data['data']['score'])
		else:
			set(attribute, data[attribute])

func get_level_data(category, key):
	return levels[category][key]

func set_level_data(category, key, value):
	levels[category][key] = value