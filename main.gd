extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.is_continuing:
		$Player.position.x = Global.player_start_x
		$Player.position.y = Global.player_start_y
	else:
		$Player.position = $PlayerSpawnMarker.position
	Global.secondlevel = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	
	
	
	
	
	$Player/Camera2D/CanvasLayer/DebugLabel.text = str($Player.get_gravity(), Global.player_artifacts, Engine.get_frames_per_second())
	$Player/Camera2D/CanvasLayer/AirBar.value = Global.air/10
	$"Player/Camera2D/CanvasLayer/Stamina Bar".value=$Player.stamina
	$"Player/Camera2D/CanvasLayer/Health Bar".value = Global.player_health
	if Global.player_health <= 0:
		get_tree().change_scene_to_file("res://THE_BAD_END.tscn")

	if Input.is_action_just_pressed("reset"):
		get_tree().call_deferred("reload_current_scene")

func _on_kill_barrier_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().call_deferred("reload_current_scene")


func _on_save_point_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var data = {
			"save_id" : 1,
			"artifacts" : int(Global.player_artifacts),
			"superartifacts" : int(Global.super_artifacts),
			"level" : int(Global.secondlevel),
			"x" : $Player.position.x,
			"y" : $Player.position.y,
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
		#data.clear()
		#Global.database.query("SELECT * FROM " + Global.table_name + ";")
		#print(Global.database.query_result[0])
	
	#print(Global.database)
