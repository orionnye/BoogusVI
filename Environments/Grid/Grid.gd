extends Node3D

class_name Grid

@onready var blankTile = load("res://Environments/BattleTiles/BlankTile.tscn")

@export var dimensions = Vector3(2, 2, 2)
@export var tileSize = Vector3(2.1, 2.1, 2.1)

func snapObject(object: Node3D):
	var excessPos = Vector3(
		fmod(object.position.x, tileSize.x),
		fmod(object.position.y, tileSize.y),
		fmod(object.position.z, tileSize.z)
	)
	var centeringOffset = tileSize/2
	var desiredPos = object.position - excessPos + centeringOffset
	object.position = desiredPos

func snapTiles():
	for tile in get_children():
		snapObject(tile)
		
func addTile(pos: Vector3 = Vector3(0, 0, 0)):
	var tile = blankTile.instantiate()
	tile.position = pos
	add_child(tile)
func addTiles(offset: Vector3, dim: Vector3):
	for z in range(dim.z):
		for y in range(dim.y):
			for x in range(dim.x):
				var tilePos = Vector3(x, y, z)*tileSize + offset
				addTile(tilePos)

# Called when the node enters the scene tree for the first time.
func _ready():
	addTiles(Vector3(-6, 0, -1), Vector3(4, 1, 1))
#	snapTiles()
#	addTile()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
