extends Area2D

@export var direction: String = "r"
@export var size: int = 2
var shoot = false
var speed = 3

func _ready():
	$AnimatedSprite2D.play("t" + str(size))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if direction == "r":
		position.x += speed
		if position.x >= 600:
			direction = "l"
	elif direction == "l":
		position.x -= speed
		if position.x <= 350:
			direction = "r"

func _on_body_entered(body):
	if (body.is_in_group('bullets')):
		if shoot == false:
			$AnimatedSprite2D.play("t" + str(size) + '_sh')
			$barrierhit.play()
			body.queue_free()
			speed = 0
			shoot = true
			Astrobarrierplayer.shooted += 1
			Astrobarrierplayer.points += 10
		else:
			body.queue_free()


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	if (area.is_in_group('blocks')):
		if direction == "l":
			direction = 'r'
		else:
			direction = 'l'
