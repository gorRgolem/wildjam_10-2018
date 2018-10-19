extends RigidBody

var speed = 12
onready var player = get_node("../Chicken")

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	var player_pos = player.get_translation()
	translate((player_pos - get_translation()).normalized() * speed * delta)
