extends Control

var database : SQLite = null
var database_name = "res://DATABASE/data.db"
#var save_dict : Dictionary = Dictionary()
var table_name := "saves"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#save_dict["save_id"] = {"data_type":"int", "primary_key": true, "not_null": true}
	#save_dict["artifacts"] = {"data_type":"int", "not_null": true}
	#save_dict["level"] = {"data_type":"int", "not_null": true}
	#save_dict["x"] = {"data_type":"real", "not_null":true}
	#save_dict["y"] = {"data_type":"real", "not_null":true}
	#save_dict["superartifacts"] = {"data_type":"int", "not_null": true}
	#save_dict["3d"] = {"data_type":"int", "not_null": true}
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	var save_dict = {
		"save_id" : {"data_type":"int", "primary_key": true, "not_null": true, "auto_increment": true},
		"artifacts" : {"data_type":"int", "not_null": true},
		"level" : {"data_type":"int", "not_null": true},
		"x" : {"data_type":"real", "not_null":true},
		"y" : {"data_type":"real", "not_null":true},
		"superartifacts" : {"data_type":"int", "not_null": true},
		"ice" : {"data_type":"int", "not_null": true},
		"fire" : {"data_type":"int", "not_null": true},
		"dragon" : {"data_type":"int", "not_null": true},
		"rock" : {"data_type":"int", "not_null": true},
		"fish" : {"data_type":"int", "not_null": true},
		"wits" : {"data_type":"int", "not_null": true},
		"will" : {"data_type":"int", "not_null": true},
		"might" : {"data_type":"int", "not_null": true},
	}
	Global.is_continuing = false
	Global.database = SQLite.new()
	Global.database.path = database_name
	Global.database.open_db()
	Global.database.create_table(table_name, save_dict)
	print("database:", Global.database)
	get_tree().change_scene_to_file("res://first_step.tscn")
	


func _on_continue_button_pressed() -> void:
	Global.database = SQLite.new()
	Global.database.path = database_name
	Global.database.open_db()
	var ary = Global.database.select_rows(Global.table_name, "save_id = 1", ["*"])
	print(ary)
	Global.is_continuing = true
	Global.player_artifacts = ary[0]["artifacts"]
	Global.player_start_x = ary[0]["x"]
	Global.player_start_y = ary[0]["y"]
	Global.secondlevel = ary[0]["level"]
	Global.super_artifacts = ary[0]["superartifacts"]
	Global.fire_art = ary[0]["fire"]
	Global.fish_art = ary[0]["fish"]
	Global.ice_art = ary[0]["ice"]
	Global.ground_art = ary[0]["rock"]
	Global.ice_art = ary[0]["ice"]
	Global.dragons_art = ary[0]["dragon"]
	Global.wit_portal_done = ary[0]["wits"]
	Global.will_portal_done = ary[0]["will"]
	Global.might_portal_done = ary[0]["might"]
	if Global.secondlevel == 1:
		get_tree().change_scene_to_file("res://boss_fight.tscn")
	else:
		get_tree().change_scene_to_file("res://main.tscn")
	


func _on_exit_button_button_up() -> void:
	get_tree().quit()
