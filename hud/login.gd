extends VBoxContainer

var strings = [{"name": "Astro Barrier", "location": "res://minigames/astro barrier/scenes/astrogamestart.tscn"}, {"name": "Thin Ice", 'location': "res://minigames/thin ice/thin1.tscn"}, {"name": "Town", "location": "res://rooms/town/towncenter.tscn"}, {"name": "OG Town", "location": "res://rooms/town/old/towncenter.tscn"}, {"name": "OG Coffee Shop",  "location": "res://rooms/cofffee_shop/coffee.tscn"}]
	
func _ready():
	for text in strings:
		var button = Button.new()
		button.text = text.name
		add_child(button)
		button.pressed.connect(Callable(self, "_on_button_pressed").bind(text))

func _on_button_pressed(text):
	Load.next_scene = text
	get_tree().change_scene_to_file('res://hud/load.tscn')
	Load.startLoad()
