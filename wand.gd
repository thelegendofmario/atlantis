extends Node3D
@onready var Muzzle = $Marker3D
var Bullet = preload("res://3d_bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("kama"):
		shoot()


func shoot():

	var b = Bullet.instantiate()
	owner.add_child(b)
	b.global_position = Muzzle.global_position
	b.global_rotation = Muzzle.global_rotation
	
