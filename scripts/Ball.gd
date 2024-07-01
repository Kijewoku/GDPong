extends Area2D
class_name Ball

@export var default_scale: Vector2 = Vector2(1, 1)
@export var default_color: Color = Color(1, 1, 1, 1)
@export var move_speed: float = 500.0
@export var direction: Vector2 = Vector2.LEFT
var bounce_sound: AudioStreamPlayer
var animation_player: AnimationPlayer

const STARTING_POINT = Vector2(640, 360)

func _ready():
	animation_player = $AnimationPlayer
	if animation_player.has_animation("bounce"):
		
		var bounceAnimation = animation_player.get_animation("bounce")
		bounceAnimation.length = 0.425

	bounce_sound = $AudioStreamPlayer
	$Sprite2D.scale = default_scale
	$Sprite2D.self_modulate = default_color

func _physics_process(delta):
	position += direction * move_speed * delta

func reset(direction: Vector2):
	self.direction = direction
	position = STARTING_POINT

func bounce(direction: Vector2):
	self.direction = direction
	bounce_sound.play()
	animation_player.stop()
	animation_player.play("bounce")

func _on_Ball_body_entered(body):
	if body.is_in_group("walls"):
		bounce(direction.bounce(body.get_normal()))
