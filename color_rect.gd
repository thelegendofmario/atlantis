extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a8 = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	modulate.a8 = 255 - Global.dPlayer_Health
