extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var counter: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	SavedData.time_secs += 1
	$Label.text = DataUtils.get_date_from_seconds(SavedData.time_secs)
	pass # Replace with function body.
