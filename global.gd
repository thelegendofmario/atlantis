extends Node

var player_in_water = false
var game_state
var defAir = 1000
var air = defAir
var airRechargeRate = 2
var airDecreaseRate = 1
var player_artifacts = 1
var player_start_x = 0 
var player_start_y = 0
var is_continuing : bool = false
var player_stamina = 0
var player_health = 100
var enemy_health = 100
var fire_art = 0
var ice_art = 0
var ground_art = 0
var fish_art = 0
var dragons_art = 0
var grass_art = false
var max_artifacts = 6
var button_on = false
var dPlayer_Health = 255
var dmarkposition = Vector3()
var super_artifacts = 1
var wit_portal_done =  0
var will_portal_done =  0
var secondlevel = 0
var might_portal_done = 0


#### DATABASE VARS ####
var database : SQLite = null
var database_path = "res://DATABASE/data.db"
var save_dict : Dictionary = Dictionary()
var table_name := "saves"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_water:
		air -= airDecreaseRate
	elif player_in_water == false:
		air += airRechargeRate
