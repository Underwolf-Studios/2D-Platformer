extends CanvasLayer

func _ready():
	global.connect("health_changed", self, "_on_global_health_changed")
	print("DEBUG: HUD loaded")

func _on_global_health_changed(health):
	if health == 3:
		$"health/tex_health_1".show()
		$"health/tex_health_2".show()
		$"health/tex_health_3".show()
	elif health == 2:
		$"health/tex_health_1".show()
		$"health/tex_health_2".show()
		$"health/tex_health_3".hide()
	elif health == 1:
		$"health/tex_health_1".show()
		$"health/tex_health_2".hide()
		$"health/tex_health_3".hide()
	elif health == 0:
		$"health/tex_health_1".hide()
		$"health/tex_health_2".hide()
		$"health/tex_health_3".hide()

	print("DEBUG: Health HUD Updated")