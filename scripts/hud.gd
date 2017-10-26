extends CanvasLayer
onready var health = 6
onready var score = 0

func _ready():
	pass

func _process(delta):
	$"health/lbl_health".text = str(health)
	$"score/lbl_score".text = str(score)