extends CharacterBody2D

@onready var sfx_collision = $"../SFX_Collision"

var direction = Vector2(init_direction(1),init_direction(0.8))
var speed = 300.0
var Stop = false

func _physics_process(delta):
	if Stop == false:
		var collision_info = move_and_collide(direction)
		if collision_info:
			sfx_collision.play()
			direction = direction.bounce(collision_info.get_normal())
			if speed <1000: #the ball speed up until reach 600
				speed += 25 
		velocity = direction * speed
		move_and_slide()
	else:
		direction = Vector2(init_direction(1),init_direction(0.8))

func init_direction(float):
	randomize()
	return [float,-float][randi() % 2]
