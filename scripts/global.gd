extends Node

signal health_changed(health)
signal score_changed(score)

var health       = 0 setget health_changed
var score        = 0 setget score_changed
const MAX_HEALTH = 3

func _ready():
	health = MAX_HEALTH
	print("DEBUG: Health: " + str(health))

func health_changed(new_value):
	health = new_value
	emit_signal("health_changed", health)
	print("DEBUG: Health: " + str(health))

func score_changed(new_value):
	score = new_value
	emit_signal("score_changed", score)
	print("DEBUG: Score: " + str(score))