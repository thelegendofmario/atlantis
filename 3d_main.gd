extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$player3d/CanvasLayer/DebugLabel.text = str($player3d.get_gravity(), Global.super_artifacts, Engine.get_frames_per_second())
	$player3d/CanvasLayer/AirBar.value = Global.air/10
	$"player3d/CanvasLayer/Stamina Bar".value=$player3d.stamina
	$"player3d/CanvasLayer/Health Bar".value = Global.dPlayer_Health/2.55
