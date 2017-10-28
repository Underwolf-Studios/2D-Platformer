extends Area2D

onready var spr_active = load("res://sprites/circle_orange.png")

var checkpoint_active = false

func _on_checkpoint_body_entered(body):
	if body.is_in_group("player") and !checkpoint_active:
		checkpoint_active = true
		$sprite.set_texture(spr_active)

		body.respawn_position = position

		print("INFO: Checkpoint activated")