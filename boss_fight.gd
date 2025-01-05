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
	b.look_at(P.global_position,Vector3.UP)
	v.look_at(P.global_position,Vector3.UP)
	c.look_at(P.global_position,Vector3.UP)
	m.look_at(P.global_position,Vector3.UP)
	n.look_at(P.global_position,Vector3.UP)
