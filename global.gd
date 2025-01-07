extends Node

var player_in_water = false
var game_state
var defAir = 1000
var air = defAir
var airRechargeRate = 2
var airDecreaseRate = 1
var player_artifacts = 1
var player_start_x
var player_start_y
var is_continuing : bool = false
var player_stamina = 0
var player_health = 100
var enemy_health = 100
var fire_art = false
var ice_art = false
var ground_art = false
var fish_art = false
var dragons_art = false
var grass_art = false
var max_artifacts = 6
var button_on = true
var dPlayer_Health = 255
var dmarkposition = Vector3()
var super_artifacts = 0

#### DATABASE VARS ####
var database : SQLite = null
var database_name = "user://test"
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
