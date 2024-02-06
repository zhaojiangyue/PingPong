extends CharacterBody2D

@onready var sfx_collision = $"../SFX_Collision"

var direction = Vector2(init_direction(1),init_direction(0.8))
const SPEED = 300.0
var Stop

func _physics_process(delta):
	var collision_info = move_and_collide(direction)
	if collision_info:
		sfx_collision.play()
		direction = direction.bounce(collision_info.get_normal())
	
	if Stop:
		direction = Vector2.ZERO
	else:
		velocity = direction * SPEED
		move_and_slide()


func init_direction(float):
	randomize()
	return [float,-float][randi() % 2]
