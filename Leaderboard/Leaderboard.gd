extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var list: VBoxContainer = $VBoxContainer/list/listVBox
var page_num: int = 0
var page_count: int = 0
onready var playerRow_tscn: PackedScene = preload("res://Leaderboard/PlayerRow.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	print(JSON.print(LeaderboardData.rest_api_json, "\t"))
	if(!LeaderboardData.get_data_local().empty()):
		page_count = (LeaderboardData.get_data_local()["player_count"] / LeaderboardData.players_per_page) + 1
	update_page(0)
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_bHighestFloor_pressed():
	pass # Replace with function body.


func _on_bScore_pressed():
	pass # Replace with function body.


func _on_bKills_pressed():
	pass # Replace with function body.


func _on_bBossKills_pressed():
	pass # Replace with function body.


func _on_bShortest_pressed():
	pass # Replace with function body.


func _on_previousPage_pressed():
	update_page(page_num-1)
	pass # Replace with function body.


func _on_nextPage_pressed():
	update_page(page_num+1)
	pass # Replace with function body.

func update_page(page: int):
	page = clamp(page, 0, page)
	var new_data: Dictionary = LeaderboardData.get_data_page(page)
	if(new_data.keys().empty()):
		return
	page_num = page
	for n in list.get_children():
		list.remove_child(n)
		n.queue_free() 
	for data in new_data["players"]:
		add_player_row(data)
	update_pages_label()
	
func update_pages_label():
	$VBoxContainer/bottom/pages_num.text = "Page " + String(page_num+1) + " / " + String(page_count)
	

func add_player_row(data: Dictionary):
	var new_player_row = playerRow_tscn.instance()
	data["score"] = DataUtils.get_score(data)
	for n in new_player_row.get_children():
		new_player_row.get_node(n.name).text = String(data[n.name])
	new_player_row.get_node("time").text = DataUtils.get_date_from_seconds(data["time"])
	list.add_child(new_player_row)
	pass

func _on_bGoBack_pressed():
	SceneTransistor.start_transition_to("res://MainScreen/MainScreen.tscn")
	pass # Replace with function body.
