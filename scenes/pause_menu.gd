extends Control
class_name Pause

@onready var button_quit : Button = $MarginContainer/Panel/CenterContainer/VBoxContainer/ButtonQuit

func _ready():
	button_quit.grab_focus()
	hide()

func _input(event):
	if event.is_action_pressed("pause"):
		set_visible(!get_tree().paused)
		button_quit.grab_focus()
		get_tree().paused = !get_tree().paused

func _on_button_quit_pressed():
	get_tree().quit()
