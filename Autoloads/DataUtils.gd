extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var score_per_kill: int = 200
export var score_per_bossKill: int = 2000
export var score_per_floor: int = 750
export var score_per_second: int = -1



func get_score(data: Dictionary) -> int:
	return data["kills"] * score_per_kill + data["bossKills"] * score_per_bossKill + data["floors"] * score_per_floor + data["time"] * score_per_second

func get_date_from_seconds(seconds: int) -> String:
	var hour: int = (seconds/3600)
	var minute: int = (seconds/60)%60
	var second: int = seconds%60
	var time = "%d:%02d:%02d" % [hour, minute, second]
	return time

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
