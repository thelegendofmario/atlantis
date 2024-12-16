extends Node

var player_in_water = false
var game_state
var defAir = 1000
var air = defAir
var airRechargeRate = 2
var airDecreaseRate = 1
var player_artifacts = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_water:
		air -= airDecreaseRate
	elif player_in_water == false:
		air += airRechargeRate
