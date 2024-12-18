extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.is_continuing:
		$Player.position.x = Global.player_start_x
		$Player.position.y = Global.player_start_y
	else:
		$Player.position = $PlayerSpawnMarker.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Player/Camera2D/CanvasLayer/DebugLabel.text = str($Player.get_gravity(), Global.player_artifacts)
	$Player/Camera2D/CanvasLayer/AirBar.value = Global.air/10
	$"Player/Camera2D/CanvasLayer/Stamina Bar".value=$Player.stamina
	if Input.is_action_just_pressed("reset"):
		get_tree().call_deferred("reload_current_scene")

func _on_kill_barrier_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().call_deferred("reload_current_scene")


func _on_save_point_body_entered(body: Node2D) -> void:
	var save_row = Dictionary()
	Global.database.delete_rows(Global.table_name, "save_id = 1")
	save_row["save_id"] = 1
	save_row["artifacts"] = Global.player_artifacts
	save_row["x"] = $Player.position.x
	save_row["y"] = $Player.position.y
	Global.database.insert_row(Global.table_name, save_row)
	save_row.clear()
	Global.database.query("SELECT * FROM " + Global.table_name + ";")
	print(Global.database.query_result[0])
	
	#print(Global.database)
