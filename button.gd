extends Area2D

var button_pressed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Global.button_on = button_pressed

func start_timer():
	var timer = get_tree().create_timer(10.0)
	timer.timeout.connect(timout)

func timout():
	button_pressed = false

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		button_pressed = true
		start_timer()
