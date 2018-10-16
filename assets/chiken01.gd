extends KinematicBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var im = InputMap
var grounded = true

var movement = {"forward" : 0, "left" : 0, "right" : 0 }
var current_state = "idle"
var new_state = "idle"

var fsm = {"idle" : {"enter" : "enter_idle", "exit" : "exit_idle"}, 
			"walk" : {"enter" : "enter_walk", "exit" : "exit_walk"}
			}
			
onready var anims = get_node("AnimationPlayer")

export var speed = 12
export var rot = 12


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	anims.play("idle")
	
	im.add_action("move_forward")
	im.add_action("turn_left")
	im.add_action("turn_right")
	
	var e1 = InputEventKey.new()
	e1.scancode = KEY_UP
	im.action_add_event("move_forward", e1)
	
	var e2 = InputEventKey.new()
	e2.scancode = KEY_LEFT
	im.action_add_event("turn_left", e2)
	
	var e3 = InputEventKey.new()
	e3.scancode = KEY_RIGHT
	im.action_add_event("turn_right", e3)
	
	
func set_movement() :
	if Input.is_action_pressed("move_forward") :
		movement["forward"] = 1
	else :
		movement["forward"] = 0
		
	if Input.is_action_pressed("turn_left") :
		movement["left"] = 1
	else :
		movement["left"] = 0
		
	if Input.is_action_pressed("turn_right") :
		movement["right"] = 1
	else :
		movement["right"] = 0
	
func set_state():
	if grounded == true :
		if movement["forward"] == 1 :
			new_state = "walk"
		if movement["forward"] == 0 :
			new_state = "idle"
			
func check_state():
	if new_state != current_state :
		call(fsm[current_state]["exit"])
		call(fsm[new_state]["enter"])
		
		current_state = new_state
		
func enter_walk() :
	print("enter walk")
	anims.play("walk.001")
func exit_walk() :
	print("exit walk")
func enter_idle() :
	print("enter idle")
	anims.play("idle")
func exit_idle() :
	print("exit idle")
			
func move(delta):
	if movement["forward"] == 1 :
		translate(Vector3(0,0,-speed*delta))
	var drot = movement["left"] - movement["right"]
	if drot == 1 :
		rotation.y += rot*delta
	elif drot == -1 :
		rotation.y -= rot*delta
	
	
#func _input(event):  
#	if Input.is_key_pressed(KEY_UP):
#		movement["forward"] = 1
#	else :
#		movement["forward"] = 0
        #code
	

func _process(delta):
	set_movement()
	set_state()
	check_state()
	move(delta)
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	