extends RichTextLabel

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		print("Pausing Game")

		if visible:
			hide()
			get_tree().paused = false
		else:
			show()
			get_tree().paused = true
