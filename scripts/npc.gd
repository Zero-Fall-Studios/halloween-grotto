class_name Npc
extends CharacterBody2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var state_machine = $StateMachine
@onready var sprite = $Sprite2D

var target

func _ready():
#	hide()
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func spawn(pos):
	position = pos
	show()
