extends Area2D

export var health_pickup = false
export var score_pickup  = false

var health_value = 1
var score_value  = 10

func _on_pickup_body_entered(body):
	if body.is_in_group("player"):
		if health_pickup and global.health < global.MAX_HEALTH:
			global.health += health_value
			queue_free()
		elif score_pickup:
			global.score += score_value
			queue_free()
		else:
			return