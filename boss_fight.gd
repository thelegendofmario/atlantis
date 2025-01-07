extends Node3D

@onready var P = $boss_player3d
@onready var b = $spawner
@onready var v = $spawner2
@onready var c = $spawner3
@onready var m = $spawner4
@onready var n = $spawner5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$boss_player3d/CanvasLayer/DebugLabel.text = str($boss_player3d.get_gravity(), Global.super_artifacts, Engine.get_frames_per_second())
	$boss_player3d/CanvasLayer/AirBar.value = Global.air/10
	$"boss_player3d/CanvasLayer/Stamina Bar".value=$boss_player3d.stamina
	$"boss_player3d/CanvasLayer/Health Bar".value = Global.player_health
	
	b.look_at(P.global_position,Vector3.UP)
	v.look_at(P.global_position,Vector3.UP)
	c.look_at(P.global_position,Vector3.UP)
	m.look_at(P.global_position,Vector3.UP)
	n.look_at(P.global_position,Vector3.UP)


func _on_portal_1_body_entered(body: Node3D) -> void:
	pass # Replace with function body.
