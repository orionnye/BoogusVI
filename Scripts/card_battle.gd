extends Node3D

#Characters on Map
@onready var player = get_node("Characters/Player")
@onready var enemy = get_node("Characters/Enemy")
@onready var characters: Array[Character] = [player, enemy]
#@onready var enemies: Array[Character] = get_node("Characters/Enemies")
#this is for reference for character buttons
@onready var activeCharacter: Character = player
#Camera to view scene
@onready var cam = get_node("WorldCamera")

func displayActiveTextAbove(character):
	var activeText = cam.get_node("ActiveDisplay")
	var charPosInCam = cam.unproject_position(character.global_position)
	var offset = Vector2(0, -300)
	var idealPos = charPosInCam+offset
	var distance = activeText.position - idealPos
	activeText.position = idealPos + (distance*0.4)

func toggleVisibility(characters: Array[Character]):
	for character in characters:
		var isActive = (character == activeCharacter)
		character.get_node("Deck").visible = isActive

func toggleActiveCharacter():
	if (activeCharacter == player):
		activeCharacter = enemy
	else:
		activeCharacter = player
	toggleVisibility(characters)

func turnCycle():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
#	Visibility starter toggle
	toggleVisibility(characters)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	displayActiveTextAbove(activeCharacter)
	if (Input.is_action_just_released("End_Turn")):
#		toggleActiveCharacter()
		await get_tree().create_timer(0.3).timeout
		activeCharacter.get_node("Deck").endTurn()
		
		print("ending turn")
	pass
