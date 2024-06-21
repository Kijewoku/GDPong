extends Area2D
class_name Player

@export var move_speed: int = 200
@export var score_display: Label
@export var score_sound: AudioStreamPlayer

var score: int = 0;

func _ready():
	pass

func increment_score():
	score += 1
	score_display.text = "%s" % score
	score_sound.play()
	pass

func _physics_process(delta):
	var input = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	position += Vector2(0, input * move_speed * delta)
	position.y = clamp(position.y, 16, get_viewport_rect().size.y - 16)

func _on_area_entered(area: Area2D):
	if area is Ball:
		var direction = Vector2.RIGHT
		direction.y = randf() * 2 - 1
		direction = direction.normalized()
		area.bounce(direction)
