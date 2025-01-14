extends CanvasLayer

var paused = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("menu"):
		paused = true
	visible = paused
	get_tree().paused = paused
	if paused == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)




func _on_continue_button_up() -> void:
	paused = false


func _on_save_button_up() -> void:
	var data = {
		"save_id" : 1,
		"artifacts" : int(Global.player_artifacts),
		"superartifacts" : int(Global.super_artifacts),
		"level" : int(Global.secondlevel),
		"x" : Global.player_start_x,
		"y" : Global.player_start_y,
		"wits" : Global.wit_portal_done,
		"will" : Global.will_portal_done,
		"might" : Global.might_portal_done,
		"ice" : Global.ice_art,
		"fire" : Global.fire_art,
		"dragon" : Global.dragons_art,
		"rock" : Global.ground_art,
		"fish" : Global.fish_art
	}
	#var save_row = Dictionary()
	Global.database.delete_rows(Global.table_name, "save_id = 1")
	#save_row["save_id"] = 1
	#save_row["artifacts"] = Global.player_artifacts
	#save_row["x"] = $Player.position.x
	#save_row["y"] = $Player.position.y
	#save_row["level"] = Global.secondlevel
	#save_row["superartifact"] = Global.super_artifacts
	Global.database.insert_row(Global.table_name, data)
	print("SAVED:0")
	#data.clear()
	#Global.database.query("SELECT * FROM " + Global.table_name + ";")
	#print(Global.database.query_result[0])


func _on_exit_button_up() -> void:
	get_tree().quit()
