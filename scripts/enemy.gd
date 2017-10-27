extends Area2D

export var damage = 1

func _on_enemy_body_entered(body):
	if body.is_in_group("player"):
		body.damage(damage)