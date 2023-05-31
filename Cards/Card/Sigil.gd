extends Node2D

class_name Sigil

var value = 5
var radix = 4

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func createSigil(center: Vector2, radix: int, alpha: float, noise: Vector2, color: Color, complete: bool = true):
	#	Gotta draw a circle with variable sides, will use this for multiRadix systems
	
	var girth = 0.5
	var size = 10
	
	var fullCircle = PI * 2
	var radianScale = fullCircle / radix
	var rotation = fullCircle / radix / 2
	
	var points = []
	for r in range(radix):
		var jitter = Vector2(randf(), randf())*noise
		var x = sin(radianScale * r + rotation)
		var y = cos(radianScale * r + rotation)
		var point = center + jitter + Vector2(x, y)*size
		points.append(point)
	
	if complete:
		points.append(points[0])
	for i in range(points.size()-1):
		var strength = randf()*alpha
		var alphaedColor = color
		alphaedColor.a = strength
		draw_line(points[i], points[i+1], alphaedColor, girth)

func _draw():
#	Pentagon
	createSigil(Vector2(randf()+10, randf()+30), 5, 1, Vector2(2, 2), Color(1, 0, 0))
#	Square
	createSigil(Vector2(40, 30), 4, 1, Vector2(8, 8), Color(0.5, 0.2, 0.2))
##	Triangle45
#	createSigil(Vector2(50, 15), 3, 1, Vector2(10, 1), Color(0, 0.5, 0))
##	Circle all noise
#	createSigil(Vector2(70, 45), 100, 4, Vector2(1, 1), Color(0, 0, 1))
##	Circle horizontal noise
#	createSigil(Vector2(100, 45), 100, 4, Vector2(3, 0), Color(0, 0, 1))
##	Circle vertical noise
#	createSigil(Vector2(120, 65), 100, 4, Vector2(0, 3), Color(0, 0, 1))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	queue_redraw()
	pass
