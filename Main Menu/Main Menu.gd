extends Spatial


func _ready():

	pass

func _input(event):
	
	
	if get_node("Button").pressed:
		get_tree().change_scene("res://Main.tscn")
	
	pass