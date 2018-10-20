extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var anim1 = get_node("grass/AnimationPlayer")
onready var anim2 = get_node("grass2/AnimationPlayer")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func play_swing():
	anim1.play("grass swings")
	anim2.play("grass swings")
	
func play_moved():
	anim1.play("grass moved")
	anim2.play("grass moved")
	


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
