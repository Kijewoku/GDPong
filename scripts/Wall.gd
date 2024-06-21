extends Area2D
class_name Wall

@export var BallResetDirection: Vector2 = Vector2.LEFT
@export var ScorerPath: NodePath

func _on_area_entered(area: Area2D):
	if area is Ball:
		var ball: Ball = area
		ball.reset(BallResetDirection)
		
		var scorer_node = get_node(ScorerPath)
		if scorer_node:
			scorer_node.increment_score()
