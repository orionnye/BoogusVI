extends Node3D

func snapTiles():
	for tile in get_children():
		get_parent().snapObject(tile)

func addTiles(pos: Vector3, dim: Vector3):
	for z in range(dim.z):
		for y in range(dim.y):
			for x in range(dim.x):
				pass
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
