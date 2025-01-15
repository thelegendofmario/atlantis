extends CenterContainer

@export var DOT_RADIUS : float = 1.0
@export var DOT_COLOR : Color = Color.WHITE
@export var RETICLE_LINES : Array[Line2D]
@export var Player_controller : CharacterBody3D
@export var Reticle_speed : float = 0.25
@export var Reticle_distance : float = 2.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	queue_redraw()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_adjust_reticle_lines()

func _draw():
	draw_circle(Vector2(0,0),DOT_RADIUS,DOT_COLOR)
	

func _adjust_reticle_lines():
	var vel = Player_controller.get_real_velocity()
	var origin = Vector3(0,0,0)
	var pos = Vector2(0,0)
	var speed = origin.distance_to(vel)
	
	RETICLE_LINES[0].position = lerp(RETICLE_LINES[0].position, pos + Vector2(0, -speed * Reticle_distance), Reticle_speed) #top    
	RETICLE_LINES[1].position = lerp(RETICLE_LINES[1].position, pos + Vector2(0, speed * Reticle_distance), Reticle_speed)  #bottom
	RETICLE_LINES[2].position = lerp(RETICLE_LINES[2].position, pos + Vector2(-speed * Reticle_distance, 0), Reticle_speed) #left
	RETICLE_LINES[3].position = lerp(RETICLE_LINES[3].position, pos + Vector2(speed * Reticle_distance, 0), Reticle_speed)  #right
