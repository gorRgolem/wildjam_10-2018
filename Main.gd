extends Spatial

const safe_zone = 10

func _ready():
	$WinPanel.hide()
	$LosePanel.hide()

	randomize()
	var range_size = 10
	spawn_node($Enemy, range_size, safe_zone, 1)
	spawn_node($Egg, range_size, safe_zone)
	
func spawn_node(node, range_size=0, margin=0, y_axis=0):
	if node == null:
		return
	if range_size == 0:
		node.translate(Vector3(0, 1, 0))
		return
	var randomXy = (randi() % range_size + margin) * (-1 if randf() < 0.5 else 1)
	node.translate(Vector3(randomXy, y_axis, randomXy))

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Egg_body_entered(body):
	if body is KinematicBody:
		$WinPanel.show()

func _on_Chicken_lose():
	$LosePanel.show()
