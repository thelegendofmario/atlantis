extends Area2D


func _ready() -> void:
	if Global.dragons_art == 1:
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.dragons_art == 1:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.dragons_art = 1
		Global.player_artifacts += 1
		$Pickup.play()
		queue_free()
