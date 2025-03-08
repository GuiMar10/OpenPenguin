extends Control

var previous_scene = ""
var next_scene = {"name": "Town", "location": "res://rooms/town/towncenter.tscn"}

func _ready():
	set_process(false)

func startLoad():
	ResourceLoader.load_threaded_request(next_scene.location)
	set_process(true)

func _process(delta):
	var progress = []
	ResourceLoader.load_threaded_get_status(next_scene.location, progress)
	if (progress[0] == 1):
		var packed_scene = ResourceLoader.load_threaded_get(next_scene.location)
		get_tree().change_scene_to_packed(packed_scene)
		set_process(false)
