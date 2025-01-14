extends Node3D
@onready var pickup_reminder = $player3d/CanvasLayer/Pickuplabel
@onready var player = $player3d
@onready var ballgreen = $Balls/ball1
@onready var ballpurple = $Balls/ball2
@onready var ballred = $Balls/ball3
@onready var ballhold = $player3d/Marker3D2
@onready var greencollect = $player3d/CanvasLayer/greenballcol
@onready var redcollect = $player3d/CanvasLayer/redballcol
@onready var purplecollect = $player3d/CanvasLayer/purpleballcol
@onready var holdergreen = $ballholders/holder1
@onready var holderred = $ballholders/holder3
@onready var holderpurple = $ballholders/holder2
@onready var gate = $walls/gate
var gatespeed= -1.5
var picked_up = false
#green ball variables
var greenpicked = false
var greenballentered = false
var greencorrect = false
#red ball variables
var redpicked = false
var redballentered = false
var redcorrect = false
#purple ball variables
var purplepicked = false
var purpleballentered = false
var purplecorrect = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pickup_reminder.visible = false
	picked_up = false 
	greenpicked = false
	greenballentered = false
	greencollect.visible = false
	redcollect.visible = false
	purplecollect.visible = false
	redpicked = false
	redballentered = false
	purplepicked = false
	purpleballentered = false
	greencorrect = false
	redcorrect = false
	purplecorrect = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if picked_up == true:
		pickup_reminder.visible = false
	if greenpicked == true:
		ballgreen.global_transform = ballhold.global_transform
		greencollect.visible = true
	if redpicked == true:
		ballred.global_transform = ballhold.global_transform
		redcollect.visible = true
	if purplepicked == true:
		ballpurple.global_transform = ballhold.global_transform
		purplecollect.visible = true
	if greenballentered == true:
		if Input.is_action_just_pressed("pick_up"):
			picked_up = true
	if redballentered == true:
		if Input.is_action_just_pressed("pick_up"):
			picked_up = true
	if purpleballentered == true:
		if Input.is_action_just_pressed("pick_up"):
			picked_up = true
	if greencorrect == true and redcorrect == true and purplecorrect == true:
		gate.position += transform.basis.y * gatespeed * delta

#code for picking up green ball
func _on_ball_1_body_entered(body: Node3D) -> void:
	if picked_up == false:
		pickup_reminder.visible = true
		greenballentered = true
func _on_ball_1_body_exited(body: Node3D) -> void:
	pickup_reminder.visible = false
	greenballentered = false
	if picked_up == true and purplepicked == false and redpicked == false:
		greenpicked = true

#holder for green ball
func _on_holder_1_body_entered(body: Node3D) -> void:
	if greenpicked == true:
		ballgreen.global_transform = holdergreen.global_transform
		picked_up = false
		greenpicked = false
		greencorrect = true
		greencollect.visible = false
	elif redpicked == true:
		ballred.global_transform = holdergreen.global_transform
		picked_up = false
		redpicked = false
		redcorrect = false
		redcollect.visible = false
	elif purplepicked == true:
		ballpurple.global_transform = holdergreen.global_transform
		picked_up = false
		purplepicked = false
		purplecorrect = false
		purplecollect.visible = false
#holder for purple ball
func _on_holder_2_body_entered(body: Node3D) -> void:
	if greenpicked == true:
		ballgreen.global_transform = holderpurple.global_transform
		picked_up = false
		greenpicked = false
		greencorrect = false
		greencollect.visible = false
	elif redpicked == true:
		ballred.global_transform = holderpurple.global_transform
		picked_up = false
		redpicked = false
		redcorrect = false
		redcollect.visible = false
	elif purplepicked == true:
		ballpurple.global_transform = holderpurple.global_transform
		picked_up = false
		purplepicked = false
		purplecorrect = true
		purplecollect.visible = false
#holder for red ball
func _on_holder_3_body_entered(body: Node3D) -> void:
	if greenpicked == true:
		ballgreen.global_transform = holderred.global_transform
		picked_up = false
		greenpicked = false
		greencorrect = false
		greencollect.visible = false
	elif redpicked == true:
		ballred.global_transform = holderred.global_transform
		picked_up = false
		redpicked = false
		redcorrect = true
		redcollect.visible = false
	elif purplepicked == true:
		ballpurple.global_transform = holderred.global_transform
		picked_up = false
		purplepicked = false
		purplecorrect = false
		purplecollect.visible = false
#code for picking up purple ball
func _on_ball_2_body_entered(body: Node3D) -> void:
	if picked_up == false:
		pickup_reminder.visible = true
		purpleballentered = true
func _on_ball_2_body_exited(body: Node3D) -> void:
	pickup_reminder.visible = false
	purpleballentered = false
	if picked_up == true and greenpicked == false and redpicked == false:
		purplepicked = true
#code for picking up red ball
func _on_ball_3_body_entered(body: Node3D) -> void:
	if picked_up == false:
		pickup_reminder.visible = true
		redballentered = true
func _on_ball_3_body_exited(body: Node3D) -> void:
	pickup_reminder.visible = false
	redballentered = false
	if picked_up == true and greenpicked == false and purplepicked == false:
		redpicked = true
