extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player_name: String = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_name_text_changed(new_text):
	player_name = $VBoxContainer/Control/name.text
	pass # Replace with function body.


func _on_bEnd_pressed():
	if(player_name == ""):
		return
	LeaderboardData.post_data(player_name, $HTTPRequest)
	
	pass # Replace with function body.


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	SavedData.reset_data()
	SceneTransistor.start_transition_to("res://MainScreen/MainScreen.tscn")
	pass # Replace with function body.


func _on_name_text_entered(new_text):
	_on_bEnd_pressed()
	pass # Replace with function body.
