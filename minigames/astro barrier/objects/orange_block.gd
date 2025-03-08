extends Area2D

func _on_body_entered(body):
	if (body.is_in_group('bullets')):
		body.queue_free()


func _on_animated_sprite_2d_animation_changed():
	position.y += 25

func _on_animated_sprite_2d_animation_finished():
	queue_free()
