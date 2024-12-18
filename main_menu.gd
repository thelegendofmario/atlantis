extends Control

var database : SQLite = null
var database_name = "user://test"
var save_dict : Dictionary = Dictionary()
var table_name := "saves"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	save_dict["save_id"] = {"data_type":"int", "primary_key": true, "not_null": true}
	save_dict["artifacts"] = {"data_type":"int", "not_null": true}
	# save_dict["level"] = {"data_type":"int", "not_null": true}
	save_dict["x"] = {"data_type":"real", "not_null":true}
	save_dict["y"] = {"data_type":"real", "not_null":true}


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	Global.is_continuing = false
	Global.database = SQLite.new()
	Global.database.path = database_name
	Global.database.open_db()
	Global.database.create_table(table_name, save_dict)
	print("database:", Global.database)
	get_tree().change_scene_to_file("res://main.tscn")
	


func _on_continue_button_pressed() -> void:
	Global.database = SQLite.new()
	Global.database.path = database_name
	Global.database.open_db()
	var ary = Global.database.select_rows(Global.table_name, "save_id = 1", ["artifacts", "x", "y"])
	print(ary)
	Global.is_continuing = true
	Global.player_artifacts = ary[0]["artifacts"]
	Global.player_start_x = ary[0]["x"]
	Global.player_start_y = ary[0]["y"]
	get_tree().change_scene_to_file("res://main.tscn")
	
