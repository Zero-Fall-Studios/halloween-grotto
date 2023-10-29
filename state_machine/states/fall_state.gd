class_name FallState
extends State

@export var idle_state: State
@export var walk_state: State
@export var run_state: State

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta

	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	
	if movement != 0:
		parent.sprite.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			if Input.is_action_pressed('run'):
				return run_state
			else:
				return walk_state
		return idle_state
	return null
