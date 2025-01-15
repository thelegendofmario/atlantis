extends Node3D

@onready var P = $boss_player3d
@onready var b = $spawner
@onready var v = $spawner2
@onready var c = $spawner3
@onready var m = $spawner4
@onready var n = $spawner5
@onready var menu = $boss_player3d/CanvasLayer/menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.secondlevel = 1
	$floors/end.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Global.super_artifacts == 4:
		$floors/end.visible = true
		#get_tree().change_scene_to_file("res://the_true_end.tscn")
	else:
		$floors/end.visible = false

	
	
	$boss_player3d/CanvasLayer/DebugLabel.text = str($boss_player3d.get_gravity(), Global.super_artifacts, Engine.get_frames_per_second())
	$boss_player3d/CanvasLayer/AirBar.value = Global.air/10
	$"boss_player3d/CanvasLayer/Stamina Bar".value=$boss_player3d.stamina
	$"boss_player3d/CanvasLayer/Health Bar".value = Global.player_health
	
	b.look_at(P.global_position,Vector3.UP)
	v.look_at(P.global_position,Vector3.UP)
	c.look_at(P.global_position,Vector3.UP)
	m.look_at(P.global_position,Vector3.UP)
	n.look_at(P.global_position,Vector3.UP)


func _on_checkpoint_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
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
		#data.clear()
		#Global.database.query("SELECT * FROM " + Global.table_name + ";")
		#print(Global.database.query_result[0])
	
	#print(Global.database)wd
