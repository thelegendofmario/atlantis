extends Node3D
@onready var floor = $NavigationRegion3D/walls/wall5
var speed = -1.5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$player2_5d/CanvasLayer/DebugLabel.text = str($player2_5d.get_gravity(), Global.super_artifacts, Engine.get_frames_per_second())
	$player2_5d/CanvasLayer/AirBar.value = Global.air/10
	$"player2_5d/CanvasLayer/Stamina Bar".value=$player2_5d.stamina
	$"player2_5d/CanvasLayer/Health Bar".value = Global.Player_3d_health
	if Global.Enemys_killed == 5:
		floor.position += floor.transform.basis.y * delta * speed
