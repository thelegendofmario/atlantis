extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_portal_1_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player") and Global.might_portal_done == 0:
		get_tree().change_scene_to_file("res://warning3_d.tscn")
