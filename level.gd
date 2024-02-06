extends Node2D
@onready var score_player = $CanvasLayer/ScorePlayer
@onready var score_opponent = $CanvasLayer/ScoreOpponent
@onready var ball = %Ball
@onready var sfx_score = $SFX_Score



func _on_opponent_win_body_entered(body):
	update_score(body,score_opponent)
	

func _on_player_win_body_entered(body):
	update_score(body,score_player)

func update_score(body,label):
	if body == ball:
		sfx_score.play()
		label.text = str(int(label.text)+1)
		body.position = get_viewport_rect().size/2
		ball.Stop = true
