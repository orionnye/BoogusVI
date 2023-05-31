extends Node3D

class_name Battle

var turn: int = 0

@onready var cam: Camera3D = get_node("CameraFocus/Camera3D")

@onready var allies = get_node("Allies")
@onready var foes = get_node("Foes")

@onready var teams = [allies, foes]
var activeTeamIndex = 0
func incrementIndex():
	activeTeamIndex += 1
	activeTeamIndex = activeTeamIndex % teams.size()
func get_activeTeam() -> Team: return teams[activeTeamIndex]

#UI
var selectedChar: Character = null

func _init():
	pass

func endTurn():
	print("ending Turn: " + str(turn))
	get_activeTeam().incrementIndex()
	incrementIndex()
	get_activeTeam().selectUnit()

func startMatch():
	get_activeTeam().selectUnit()

func deselectUnit():
	if (selectedChar != null):
		selectedChar.get_node("characterMesh").scale = Vector3(1, 1, 1)
		selectedChar.hideUI()
		selectedChar = null

# ---------START UP FUNCTION-------- Called when the node enters the scene tree for the first time.
func _ready():
#	place the characters in scene
	$"Allies".addUnits(2, "Player")
	$"Foes".addUnits(2, "Enemy")
	startMatch()
#	organize characters by speed and begin the turn order
	print("battle start!")

# ---------Called every frame-------- 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	will run checks for removing characters from scene
#	will be responsible for turn cycle management on input
	if (Input.is_action_just_pressed("ui_cancel")):
#		Detect if character or card is selected
		if (selectedChar != null):
			if (selectedChar.get_selectedCard() != null):
				selectedChar.deselectCards()
			else:
				deselectUnit()
	if (Input.is_action_just_pressed("End_Turn")):
		if (selectedChar == null):
			pass
#		retrieve selected character and card cycle on them
		if (selectedChar != null):
			endTurn()
			selectedChar.deck.cardCycle()
