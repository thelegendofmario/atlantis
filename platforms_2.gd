extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.button_on == false:
		visible = false
		get_node("CollisionShape2D").disabled = not visible

	if Global.button_on == true:
		visible = true
		get_node("CollisionShape2D").disabled = not visible
