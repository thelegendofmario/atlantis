extends Node3D
@export var weapon : Node3D
@export var flash_time : float = 0.05
@export var light : OmniLight3D
@export var emitter : GPUParticles3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	weapon.weapon_fired.connect(_muzzle_flash)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _muzzle_flash() -> void:
	light.visible = true
	emitter.emitting = true
	await get_tree().create_timer(flash_time).timeout
	light.visible = false
