extends Node

var num_floor: int = 0
var num_kills: int = 0
var num_bKills: int = 0
var time_secs: int = 0

var hp: int = 4
var weapons: Array = []
var equipped_weapon_index: int = 0

var player: Character


func get_data_as_dict(name: String) -> Dictionary:
	var data: Dictionary = {
		"pname": name,
		"floors": num_floor,
		"kills": num_kills,
		"bossKills": num_bKills,
		"time": time_secs
	}
	return data


func reset_data() -> void:
	num_floor = 0
	
	hp = 4
	weapons = []
	equipped_weapon_index = 0

