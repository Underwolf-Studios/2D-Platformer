extends Node

signal health_changed(health)
signal score_changed(score)
signal game_over(game_over)

var health       = 0 setget health_changed
var score        = 0 setget score_changed
var game_over    = false setget game_over
const MAX_HEALTH = 3

func _ready():
	health = MAX_HEALTH
	print("INFO: Health: " + str(health))

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