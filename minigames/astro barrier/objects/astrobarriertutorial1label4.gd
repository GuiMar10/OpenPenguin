extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene_to_file("res://minigames/astro barrier/scenes/astrogame1.tscn")
