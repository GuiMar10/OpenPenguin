extends Area2D

var shoot = false
var speed = 3
var direction = "right"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if direction == "right":
		position.x += speed
		if position.x >= 600:
			direction = "left"
	elif direction == "left":
		position.x -= speed
		if position.x <= 450:
			direction = "right"
	

func _on_body_entered(body):
		if shoot == false:
			$AnimatedSprite2D.play("astroalvo2")
			$barrierhit.play()
			body.queue_free()
			speed = 0
			shoot = true
			Astrobarrierplayer.shooted += 1
			Astrobarrierplayer.points += 10
		else:
			body.queue_free()
	
