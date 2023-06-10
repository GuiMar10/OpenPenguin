extends CharacterBody2D

const TIRO := preload("res://minigames/astro barrier/objects/astrobarrierbullet.tscn")
const SPEED = 140.0
var astrobarriertiros = 8
var shooted = 0
var lives = 2
var points = 0

func _physics_process(delta):
	if shooted == 4 and get_tree().get_current_scene().name == "astrogame1":
		get_tree().change_scene_to_file("res://minigames/astro barrier/scenes/astrogame2.tscn")
		shooted = 0
		astrobarriertiros = 7
	
	if astrobarriertiros <= 0 and lives >= 0:
		lives -= 1
		astrobarriertiros = 5
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
