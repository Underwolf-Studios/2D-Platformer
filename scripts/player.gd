extends KinematicBody2D

var velocity = Vector2()

const GRAVITY        = 3000
const WALK_SPEED     = 1000
const JUMP_FORCE     = 1200
const MAX_JUMP_COUNT = 2

var jump_count = 0
var in_air     = false

var respawn_position = Vector2()

func _ready():
	respawn_position = position

func _physics_process(delta):
	var target_speed = 0

	velocity.y += GRAVITY * delta

	if Input.is_action_pressed("move_left"):
		target_speed -= 1
	if Input.is_action_pressed("move_right"):
		target_speed += 1

	target_speed *= WALK_SPEED
	velocity.x = lerp(velocity.x, target_speed, 0.5)
	velocity = move_and_slide(velocity, Vector2(0, -1))

	if is_on_floor():
		jump_count = 0
		in_air = false

func _input(event):
	if event.is_action_pressed("move_up") and jump_count < MAX_JUMP_COUNT:
		velocity.y = -JUMP_FORCE
		jump_count += 1

func damage(amount):
	global.health -= amount
	if global.health <= 0:
		# Game Over
		global.game_over = true

	respawn()

func respawn():
	position = respawn_position