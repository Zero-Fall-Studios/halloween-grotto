class_name Character
extends CharacterBody2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var state_machine = $StateMachine
@onready var sprite = $Sprite2D

var is_animation_running : bool = false

func _ready():
	hide()
	state_machine.init(self)
	animation_player.animation_started.connect(_on_animation_started)
	animation_player.animation_finished.connect(_on_animation_finished)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
		
func _on_animation_started(anim_name: StringName):
	is_animation_running = true
	
func _on_animation_finished(anim_name: StringName):
	is_animation_running = false
	
func spawn(pos):
	position = pos
	show()
