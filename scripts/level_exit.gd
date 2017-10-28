extends Area2D

export var level = 0

func _on_level_exit_body_entered(body):
	if body.is_in_group("player"):
		global.level_finished = true