extends CharacterBody2D

var direction = Vector2(init_direction(1),init_direction(0.8))
const SPEED = 300.0

func _physics_process(delta):
	var collision_info = move_and_collide(direction)
	if collision_info:
		direction = direction.bounce(collision_info.get_normal())
	velocity = direction * SPEED
	move_and_slide()

func init_direction(float):
	randomize()
	return [float,-float][randi() % 2]
