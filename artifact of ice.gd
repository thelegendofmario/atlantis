extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.ice_art == true:
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.ice_art == true:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.ice_art = true
		Global.player_artifacts += 1
		queue_free()
