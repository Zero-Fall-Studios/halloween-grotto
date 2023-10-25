class_name IdleState
extends State

@export var move_state : State

func enter():
	parent.animation_player.play("idle")
	return null

func exit(): 
	return null
	
func process_physics(delta):		
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		return move_state
