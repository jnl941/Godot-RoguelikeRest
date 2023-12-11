extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var selected : int = 0
onready var buttons : Array 

func _init():
	var screen_size: Vector2 = OS.get_screen_size()
	var window_size: Vector2 = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)


# Called when the node enters the scene tree for the first time.
func _ready():
	buttons = [$buttons/bStartGame, $buttons/bLeaderboard]
	update_choice()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if(event.is_action_pressed("ui_accept")):
		choose()
		pass
	elif(event.is_action_pressed("ui_up")):
		selected += 1
		update_choice()
		pass
	elif(event.is_action_pressed("ui_down")):
		selected -= 1
		update_choice()
		pass

func choose():
	print(selected)
	match selected:
		0:
			_on_bStartGame_pressed()
		1:
			_on_bLeaderboard_pressed()

func update_choice():
	selected %= buttons.size()
	
	var button : Button
	$cursor.position.y = buttons[selected].rect_global_position.y + 12
	pass

func _on_bLeaderboard_pressed():
	SceneTransistor.start_transition_to("res://")
	pass # Replace with function body.


func _on_bStartGame_pressed():
	SceneTransistor.start_transition_to("res://Game.tscn")
	pass # Replace with function body.
