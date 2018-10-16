extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_contact_monitor( true )
	set_max_contacts_reported( 5 )
#	connect("body_enter",self,"body_enter")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
