extends Area2D

func _on_body_entered(body):
	if (body.is_in_group('bullets')):
		body.queue_free()
		for node in get_tree().get_nodes_in_group("orange_blocks"):
			node.get_node("AnimatedSprite2D").play('destroy')
