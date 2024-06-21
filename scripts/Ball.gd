extends Area2D
class_name Ball

@export var move_speed: float = 1000.0
@export var direction: Vector2 = Vector2.LEFT
var bounce_sound: AudioStreamPlayer

const STARTING_POINT = Vector2(640, 360)

func _ready():
	bounce_sound = $AudioStreamPlayer

func _physics_process(delta):
	position += direction * move_speed * delta

func reset(direction: Vector2):
	self.direction = direction
	position = STARTING_POINT

func bounce(direction: Vector2):
	self.direction = direction
	bounce_sound.play()
