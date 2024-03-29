extends CharacterBody2D


const SPEED = 800.0

func _physics_process(delta):
	if %Ball.Stop == false:
		var direction = Input.get_axis("ui_up","ui_down")
		if direction:
			velocity.y = direction * SPEED
		else:
			velocity.y = move_toward(velocity.y, 0, 100)
		move_and_slide()
	else:
		position.y = get_viewport_rect().size.y/2
