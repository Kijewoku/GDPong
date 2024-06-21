extends Area2D

@export var BounceDirection: int = 1

func _on_area_entered(area: Area2D):
	if area is Ball:
		var ball: Ball = area
		var direction: Vector2 = (ball.direction + Vector2(0, BounceDirection)).normalized()
		ball.bounce(direction)
