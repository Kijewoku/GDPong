extends Node

class_name HasScore

var entity_name: StringName
var score: int = 0
var score_display: Label
var score_sound: AudioStreamPlayer

func _init(entity_name: StringName = "", score_display: Label = null, score_sound: AudioStreamPlayer = null):
	self.entity_name = entity_name
	self.score_display = score_display
	self.score_sound = score_sound

func increment_score():
	score += 1
	if score_display:
		score_display.text = str(score)
		print(entity_name + " scored. Currently at " + str(score) + ".")
	if score_sound:
		score_sound.play()
