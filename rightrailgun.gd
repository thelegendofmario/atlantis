extends Node3D
@export var camera_controller : Camera3D
var raycast_test = preload("res://hit.tscn")
signal weapon_fired
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _attack() -> void:
	weapon_fired.emit()
	var camera = camera_controller
	var space_state = camera.get_world_3d().direct_space_state
	var screen_center = get_viewport().size / 2
	var origin = camera.project_ray_origin(screen_center)
	var end = origin + camera.project_ray_normal(screen_center) * 1000
	var query = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_bodies
	var result = space_state.intersect_ray(query)
	if result:
		_test_raycast(result.get("position"))
	


func _test_raycast(position: Vector3) -> void:
	var instance = raycast_test.instantiate()
	get_tree().root.add_child(instance)
	instance.global_position = position
	await get_tree().create_timer(3).timeout
	instance.queue_free()
