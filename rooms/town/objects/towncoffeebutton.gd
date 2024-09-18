extends Button

func _on_mouse_entered():
	$AnimatedSprite2D.play("opened")
	$open.play()


func _on_mouse_exited():
	$AnimatedSprite2D.play("closed")
	$close.play()
