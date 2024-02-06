extends Node2D
@onready var score_player = $CanvasLayer/ScorePlayer
@onready var score_opponent = $CanvasLayer/ScoreOpponent
@onready var ball = %Ball


func _on_opponent_win_body_entered(body):
	update_score(body,score_opponent)

func _on_player_win_body_entered(body):
	update_score(body,score_player)

func update_score(body,label):
	if body == ball:
		label.text = str(int(label.text)+1)
