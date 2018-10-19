extends Spatial

const safe_zone = 10

func _ready():
	$WinPanel.hide()
	$LosePanel.hide()

	randomize()
	var range_size = 10
	var randomXy = (randi() % range_size + safe_zone) * (-1 if randf() < 0.5 else 1)
	$Enemy.translate(Vector3(randomXy, 1, randomXy))
	$Egg.translate(Vector3(randomXy, 0, randi() % randomXy))

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Egg_body_entered(body):
	if body is KinematicBody:
		$WinPanel.show()

func _on_Chicken_lose():
	$LosePanel.show()
