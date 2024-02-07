extends Node2D
@onready var score_player = $CanvasLayer/ScorePlayer
@onready var score_opponent = $CanvasLayer/ScoreOpponent
@onready var ball = %Ball
@onready var sfx_score = $SFX_Score

func _process(delta):
	if ball.Stop == true:
		$CanvasLayer/CountTime.text = str(int($CanvasLayer/Timer.time_left))
	else:
		$CanvasLayer/CountTime.text = ""

func _on_opponent_win_body_entered(body):
	update_score(body,score_opponent)


func _on_player_win_body_entered(body):
	update_score(body,score_player)


func update_score(body,label):
	if body == ball:
		$CanvasLayer/Timer.start()
		sfx_score.play()
		label.text = str(int(label.text)+1)
		body.position = get_viewport_rect().size/2
		ball.Stop = true
		ball.speed = 300


func _on_timer_timeout():
	ball.Stop = false # Replace with function body.
