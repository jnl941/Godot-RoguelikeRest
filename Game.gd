extends Node2D

onready var requester = $HTTPRequest


func _init() -> void:
	randomize()
	
	var screen_size: Vector2 = OS.get_screen_size()
	var window_size: Vector2 = OS.get_window_size()
	
	OS.set_window_position(screen_size * 0.5 - window_size * 0.5)


func _ready() -> void:
	requester.request("http://atesting7723.eu.pythonanywhere.com")
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_focus_next"):
		get_tree().paused = true


## procesar lo recibido tras un request. más comúnmente para GETs.
## result: código de error del nodo. 0 si todo ha ido bien.
## response_code: código de estado HTTP. 200 si todo ha ido bien.
## body: stream de chars con el cuerpo del mensaje de respuesta del servidor (podría ser json...).
func _on_HTTPRequest_request_completed(result: int, response_code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	if result != OK:
		print("request failed!! " + str(result))
		return
	
	if not body or body.empty():
		print("empty body!! " + str("response_code"))
		return
	
	print(str(response_code) + ": " + str(body.get_string_from_utf8()))
