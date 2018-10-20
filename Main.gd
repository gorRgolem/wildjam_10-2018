extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var grid_x = 20
export var grid_z = 20
onready var grass_scene = load("res://Grass.tscn")
var grass = null
var place = 0

func _ready():
	$WinPanel.hide()
	$LosePanel.hide()
	for x in range (grid_x):
	        
		for z in range (grid_z):
			place = randi()%10+1
			if place > 3:
				grass = grass_scene.instance()
				grass.translation = Vector3((x*1.75-grid_x+3.5),0,(z*1.75-grid_z+3.5))
				add_child(grass)


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Egg_body_entered(body):
	if body is KinematicBody:
		$WinPanel.show()

func _on_Chicken_lose():
	$LosePanel.show()
