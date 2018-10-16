extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Panel.hide()
	$Panel2.hide()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area_body_entered(body):
	if body is KinematicBody:
		$Panel.show()


func _on_Area2_body_entered(body):
	if body is KinematicBody:
		$Panel2.show()
