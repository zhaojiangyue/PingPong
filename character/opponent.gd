extends CharacterBody2D

@onready var ball = get_node("%Ball")
var up = Vector2(0,-1)
var down = Vector2(0,1)
var speed = 300

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if %Ball.Stop == false:
		speed = ball.speed #Follow ball speed
		if ball.direction.y < 0 && ball.position.y < position.y:
			velocity = up * speed
		elif  ball.direction.y > 0 && ball.position.y > position.y:
			velocity = down * speed
		move_and_slide()
	else:
		position.y = get_viewport_rect().size.y/2
