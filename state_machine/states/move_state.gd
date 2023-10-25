class_name MoveState
extends State

@export var speed : float = 50
@export var idle_state : State

func enter():
	parent.animation_player.play("walk")
	return null

func exit(): 
	return null
	
func process_physics(delta):		
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		parent.velocity.x = direction * speed
		if parent.velocity.x < 0:
			parent.sprite.flip_h = true
		else:
			parent.sprite.flip_h = false
	else:
		parent.velocity.x = move_toward(parent.velocity.x, 0, speed)
		
	if parent.velocity.x == 0:
		return idle_state
		
	parent.move_and_slide()
