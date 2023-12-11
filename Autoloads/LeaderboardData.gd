extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rest_api_json: Dictionary
var rest_api_json_string: String

var players_per_page = 8


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func save_data_local(player_name: String):
	#TODO: make it work with html protocols and rest
	var data_to_send: Dictionary = SavedData.get_data_as_dict(player_name)
	if(rest_api_json.has("player_count")):
		rest_api_json["player_count"] += 1
	else:
		rest_api_json["player_count"] = 1
	var page_num = rest_api_json["player_count"]/(players_per_page+1)
	if(!rest_api_json.has("pages")):
		rest_api_json["pages"] = []
	var players: Array = rest_api_json["pages"]
	if(players.size() < page_num+1):
		players.append({
			"page": page_num,
			"players": []
		})
	players[page_num]["players"].append(data_to_send)
	
	
func get_data_local() -> Dictionary:
	rest_api_json_string = JSON.print(rest_api_json)
	return parse_json(rest_api_json_string)
	

func get_data_page(page_num : int) -> Dictionary:
	var data: Dictionary = get_data_local()
	if(!typeof(data) == TYPE_DICTIONARY || !data.has("pages") || page_num+1 > data["pages"].size()):
		return Dictionary()
	return data["pages"][page_num]

	# Save data
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
