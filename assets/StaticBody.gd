extends Area

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _on_StaticBody_body_entered(body) : 
	if body is KinematicBody:
		queue_free()
		print("i'm grass !!")
		play_moved()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
