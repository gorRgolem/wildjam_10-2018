extends RigidBody

var speed = 12
onready var player = get_node("../Chicken")
var stop = false

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	if stop == true:
		translate(Vector3(0, 0, 0))
	else:
		var player_pos = player.get_translation()
		translate((player_pos - get_translation()).normalized() * speed * delta)


func _on_Enemy_body_entered(body):
	if body is KinematicBody:
		stop = true
