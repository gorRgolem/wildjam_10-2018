extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$WinPanel.hide()
	$LosePanel.hide()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Egg_body_entered(body):
	if body is KinematicBody:
		$WinPanel.show()


func _on_Player_lose():
	$LosePanel.show()
