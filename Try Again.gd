extends Button


func _ready():

	pass

func _input(event):
	
	if self.pressed:
		get_tree().reload_current_scene()