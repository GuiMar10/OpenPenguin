extends CharacterBody2D

const TIRO := preload("res://minigames/astro barrier/objects/astrobarrierbullet.tscn")
const SPEED = 140.0
var astrobarriertiros = 8
var shooted = 0
var lives = 2
var points = 0
var level = 1

func _physics_process(delta):
	if shooted == 4 and level == 1:
		shooted = 0
		get_tree().change_scene_to_file("res://minigames/astro barrier/scenes/astrogame2.tscn")
		level = 2
		astrobarriertiros = 7
	
	if shooted == 1 and level == 2:
		shooted = 0
		get_tree().change_scene_to_file("res://minigames/astro barrier/scenes/astrogame3.tscn")
		level = 3
		astrobarriertiros = 7
	
	if shooted == 3 and level == 3:
		shooted = 0
		get_tree().change_scene_to_file("res://minigames/astro barrier/scenes/astrogame4.tscn")
		level = 4
		astrobarriertiros = 9
	
	if astrobarriertiros <= 0 and lives >= 0:
		lives -= 1
		if level == 1:
			astrobarriertiros = 8
		elif level == 2 or level == 3:
			astrobarriertiros = 7
		elif level == 4:
			astrobarriertiros = 9
		shooted = 0
		get_tree().reload_current_scene()
	
	if lives < 0:
		lives = 2

	if Input.is_action_just_pressed("space") and astrobarriertiros > 0:
		var shoot_instance = TIRO.instantiate()
		get_parent().add_child(shoot_instance)
		shoot_instance.position = position
		astrobarriertiros -= 1
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
