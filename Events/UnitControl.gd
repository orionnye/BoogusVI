extends Node3D

class_name Team

@onready var focus = get_node("../CameraFocus")
@onready var battle = get_parent()
@onready var selectedIndex = 0
func incrementIndex():
	selectedIndex += 1
	selectedIndex = selectedIndex % get_children().size()

func get_team(teamName: String) -> Array[Character]:
	var team: Array[Character] = []
	for unit in get_children():
		if (unit.team == teamName):
			team.push_back(unit)
	return team

func get_selectedUnit() -> Character:
	var units = get_children()
	return units[selectedIndex]

func assignPositionsToTeam(teamName: String, offset: Vector3, spacing: Vector3 = Vector3(3, 0, 0)):
	var team = get_team(teamName)
	for i in range(team.size()):
		var unit = team[i]
		unit.position = offset + spacing*i
	rotateTeam(teamName)

func rotateTeam(teamName: String):
	var team = get_team(teamName)
	if team.size() > 0:
		for unit in team:
			unit.look_at(focus.position, Vector3(0, 1, 0))

func addUnits(count: int, team: String):
	for i in range(count):
		var clone: Character = load("res://Characters/Default/Character.tscn").instantiate()
		clone.team = team
		clone.clicked.connect(clickOnUnit)
		add_child(clone)

func clickOnUnit(unit: Character):
	if (battle.selectedChar != null and battle.selectedChar.get_selectedCard() != null):
		print("Use a card instead of selecting a character")
		battle.selectedChar.get_selectedCard()._call(battle.selectedChar, unit)
#	else:
#		selectUnit(unit)
#SelectedChar offset
var selectedCharOffset = Vector3(0, 0.5, 0)

func selectUnit():
	var unit = get_selectedUnit()
	if (battle.selectedChar != null):
		battle.selectedChar.get_node("characterMesh").scale = Vector3(1, 1, 1)
		battle.selectedChar.hideUI()
	battle.selectedChar = unit
	battle.selectedChar.get_node("characterMesh").scale = Vector3(1.1, 1.1, 1.1)
	battle.selectedChar.showUI()

# Called when the node enters the scene tree for the first time.
func _ready():
#	rePositionUnits()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	update UI
	pass

func _on_child_entered_tree(_node):
	assignPositionsToTeam("Player", Vector3(-2, 0, 0), Vector3(-3, 0, 0))
	assignPositionsToTeam("Enemy", Vector3(2, 0, 0))
	pass # Replace with function body.
