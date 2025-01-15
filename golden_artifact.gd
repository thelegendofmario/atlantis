extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://boss_fight.tscn")
		Global.super_artifacts += 1
		Global.will_portal_done = 1
	if body.is_in_group("player2_d"):
		get_tree().change_scene_to_file("res://boss_fight.tscn")
		Global.super_artifacts += 1
		Global.wit_portal_done = 1
	if body.is_in_group("player_3"):
		get_tree().change_scene_to_file("res://boss_fight.tscn")
		Global.super_artifacts += 1
		Global.might_portal_done = 1
