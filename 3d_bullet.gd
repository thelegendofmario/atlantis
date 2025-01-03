extends Area3D

var speed = -15
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.basis.z * speed * delta 



func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("ground"):
		queue_free()

func _on_timer_timeout() -> void:
	queue_free()
