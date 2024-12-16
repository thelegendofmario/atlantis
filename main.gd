extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Player/Camera2D/CanvasLayer/DebugLabel.text = str($Player.get_gravity(), Global.player_artifacts)
	$Player/Camera2D/CanvasLayer/AirBar.value = Global.air/10


func _on_kill_barrier_body_entered(body: Node2D) -> void:
	get_tree().call_deferred("reload_current_scene")
