extends Node

signal health_changed(health)

var score        = 0
var health       = 0 setget health_changed
const MAX_HEALTH = 3

func _ready():
	health = MAX_HEALTH
	print("DEBUG: Health: " + str(health))

func health_changed(new_value):
	health = new_value
	emit_signal("health_changed", health)
	print("DEBUG: Health: " + str(health))