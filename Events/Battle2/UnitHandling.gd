extends Node3D

#var characterRef = load("res://Characters/Default/Character.tscn")
var dimensions = Vector3(5, 0, 0)
#var selectedChar: Character = null

#func init_Team(partyCount: int = 1):
#	for i in partyCount:
#		var partyMember = characterRef.instantiate()
#		add_child(partyMember)

#func spawnUnits(count = 1):
#	print("spawning ", count, " enemies")
#	for i in range(count):
#		print("spawning: ", i)
#		var clone: Character = load("res://Characters/Default/Character.tscn").instantiate()
#		add_child(clone)
#	rePositionUnits()

#could just be get_children but if we add other children that aren't unit's, this will help
#func get_units() -> Array[Character]:
#	var units: Array[Character] = []
#	for child in self.get_children():
#		if (child is Character):
#			units.append(child)
#	return units

#func rePositionUnits():
#	var size = get_children().size()
#	var indexOffset = dimensions / size
#	for i in size:
#		var child = get_child(i)
#		#Rotate member to cheat out and face camera a little
#		var cheatOutRadian = -0.5
#		if dimensions.x > 0:
#			cheatOutRadian = PI - cheatOutRadian
#		child.get_node("characterMesh").rotation = Vector3(0, cheatOutRadian, 0)
#		#Position Member to be spaced properly relative to team.
#		child.position = indexOffset*i

#func cullDead():
#	for unit in self.get_units():
#		if (unit.hp <= 0):
#			self.remove_child(unit)

#func _init(position: Vector3 = Vector3(0, 0, 0), dim: Vector3 = Vector3(1, 1, 1)):
#	self.dimensions = dim
#	self.position = position

# Called when the node enters the scene tree for the first time.
func _ready():
#	init_Team(4)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
