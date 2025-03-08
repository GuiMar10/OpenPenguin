extends CharacterBody2D

const TIRO := preload("res://minigames/astro barrier/objects/astrobarrierbullet.tscn")
const SPEED = 140.0
var shots = 8
var shooted = 0
var lives = 2
var points = 0
var level = 1
var levelData = [{"shoots": 4}, {"shoots": 1}, {"shoots": 3}, {"shoots": 4}]
	
func _physics_process(_delta):
	if shooted == levelData[level - 1]["shoots"]:
		shooted = 0
		get_tree().change_scene_to_file("res://minigames/astro barrier/scenes/astrogame" + str(level + 1) + ".tscn")
		level += 1
		shots = 7
	
	if shots <= 0 and lives >= 0:
		lives -= 1
		if level == 1:
			shots = 8
		elif level == 2 or level == 3:
			shots = 7
		elif level == 4:
			shots = 9
		shooted = 0
		get_tree().reload_current_scene()
	
	if lives < 0:
		lives = 2

	if Input.is_action_just_pressed("space") and shots > 0:
		var shoot_instance = TIRO.instantiate()
		get_parent().add_child(shoot_instance)
		shoot_instance.position = position
		shots -= 1
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
