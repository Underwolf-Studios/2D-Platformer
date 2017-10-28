extends Node

signal health_changed(health)
signal score_changed(score)
signal game_over(game_over)
signal level_finished(level_finished)

const MAX_HEALTH   = 3
var health         = 0 setget health_changed
var score          = 0 setget score_changed
var game_over      = false setget game_over
var level_finished = false setget level_finished
var current_level  = null

func _ready():
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