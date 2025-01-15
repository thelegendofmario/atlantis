extends CharacterBody3D

@export var Player_path : NodePath
@export var color : Color
@export var aggro_range := 200.0
@export var fire_speed := 0.2
@export var attack_power := 5
@export var Player : CharacterBody3D

var health = 20
var material
var player = null
var bullet = preload("res://3d_bomb.tscn")

@onready var gun = $gun
@onready var nav = $NavigationAgent3D
@onready var sight = $sight
@onready var engaged_timer = $Timer

var last_shot := 0.0
var speed := 1.0

var start_position 
var engaged = false

func _ready():
	player = get_node(Player_path)
	start_position = global_position
	var mat = StandardMaterial3D.new
	#mat.set_albedo(color)
	#mat.emission_enabled = true
	#material = mat


func _take_damage(dmg):
	health -= dmg
	engaged = true 
	engaged_timer.start()
	if health < 1:
		queue_free()
	#var tween = get_tree().create_tween()
	#tween.tween_property(material, "emission",Color(2,1,1,1), 0.02)
	#tween.tween_property(material, "emission",Color(0,0,0,1), 0.2)
	
	
func _fire():
	var now := Time.get_ticks_msec()/1000
	if now < last_shot+fire_speed: return
	last_shot = now
	var b = bullet.instantiate()
	b.damage = attack_power
	b.global_transform = gun.global_transform
	get_parent().add_child(b)


func _process(delta):
	velocity = Vector3.ZERO
	if global_position.distance_to(player.global_position) < aggro_range or engaged:
		nav.set_target_position(player.global_transform.origin)
		if sight.get_collider() is CharacterBody3D:
			_fire()
		look_at(Vector3(player.global_position.x,player.global_position.y,player.global_position.z),Vector3.UP)
	elif global_position.distance_to(start_position) > 5:
		nav.set_target_position(start_position)
		look_at(Vector3(start_position.x,start_position.y,start_position.z),Vector3.UP)
	
	var next_position = nav.get_next_path_position()
	velocity = (next_position - global_transform.origin).normalized()
	if health < 1:
		Global.Enemys_killed += 1
		queue_free()
		
	move_and_slide()
