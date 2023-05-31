extends Node3D

#Unit Tiles
@onready var blankTile = load("res://Environments/BattleTiles/BlankTile.tscn")
var tileCount = 3
@export var tileSize = Vector3(2.3, 0, 0)
@export var initialOffset = Vector3(1, 0, 0)
@export var direction = Vector3(-1, 0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
#	place some tiles here
	print("I'm placing tiles")
	for i in range(tileCount):
		var tileClone = blankTile.instantiate()
		var randOffset = Vector3(0, randf_range(-0.2, 0.2), randf_range(-0.4, 0.4))
		var tilePos = tileSize*i + randOffset
		if (i >= tileCount):
			tilePos = tileSize*i*direction
		tileClone.position = tilePos + initialOffset
		add_child(tileClone)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
