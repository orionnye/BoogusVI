extends Node3D

@export var rotationCaps: Vector3 = Vector3(0.4, 0.7, 0)
@export var lerpSpeed: float = 0.3
@export var lerpCorrectSpeed: float = 0.05
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var rot = Vector3(0, 0, 0)
	if (Input.is_action_pressed("W")):
		if (rotation.x >= -rotationCaps.x):
			var rotationSmooth = (-rotationCaps.x-rotation.x)*lerpSpeed
			rot.x += rotationSmooth
	if (Input.is_action_pressed("S")):
		if (rotation.x <= rotationCaps.x):
			var rotationSmooth = (rotationCaps.x-rotation.x)*lerpSpeed
			rot.x += rotationSmooth
	if (Input.is_action_pressed("A")):
		if (rotation.y >= -rotationCaps.y):
			var rotationSmooth = (-rotationCaps.y-rotation.y)*lerpSpeed
			rot.y += rotationSmooth
	if (Input.is_action_pressed("D")):
		if (rotation.y <= rotationCaps.y):
			var rotationSmooth = (rotationCaps.y-rotation.y)*lerpSpeed
			rot.y += rotationSmooth
	
	rotation += rot * delta
	if (rot.y == 0):
		rotation.y = rotation.y*lerpCorrectSpeed
	if (rot.x == 0):
		rotation.x = rotation.x*lerpCorrectSpeed
