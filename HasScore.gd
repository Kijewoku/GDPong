class_name HasScore

signal score_incremented

var score: int = 0
var score_display_path: NodePath
var score_sound_path: NodePath
var score_display: Label
var score_sound: AudioStreamPlayer

func increment_score():
	score += 1
	if score_display:
		score_display.text = str(score)
	if score_sound:
		score_sound.play()
	emit_signal("score_incremented")
