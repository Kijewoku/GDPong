extends Area2D
class_name Enemy

@export var follow: NodePath
@export var difficulty: float = 0.3
@export var score_display: Label
@export var score_sound: AudioStreamPlayer

var score: int = 0

func _ready():
	pass

func increment_score():
	score += 1
	score_display.text = "%s" % score
	score_sound.play()
	pass

func _physics_process(delta):
	var follow_node = get_node(follow) as Area2D
	if follow_node:
		position.y = lerp(position.y, follow_node.position.y, difficulty / 10)
		position.y = clamp(position.y, 16, get_viewport_rect().size.y - 16)

func _on_area_entered(area: Area2D):
	if area is Ball:
		var direction = Vector2.LEFT
		direction.y = randf() * 2 - 1
		direction = direction.normalized()
		area.bounce(direction)
