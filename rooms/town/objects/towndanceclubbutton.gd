extends Button

func _on_mouse_entered():
	$danceclubbuttonsprite.play("opening")
	$open.play()


func _on_mouse_exited():
	$danceclubbuttonsprite.play("closing")
	$close.play()
