extends Camera3D

#Imports
var HealthBar = load("res://UI/HealthBar/HealthBar.tscn")

@export var player: Node3D
@export var targets: Node3D

@onready var mouse: Node2D = get_node("MouseMarker")
@onready var selectedCharacter: Character = player

func displayCharacterHP(character: Character):
	var charPosInCam = unproject_position(character.global_position)
	var offset = Vector2(-100, 180)
	var hp = character.get_node("HealthBar")
	hp.position = (charPosInCam + offset)
#	add_child(hp)

func displayCharacterButton(character: Character):
	var charPosInCam = unproject_position(character.global_position)
	var button = character.get_node("Button")
	var buttonSize = Vector2(250, 400)
	var offset = Vector2(0, -30)
	
	button.position = charPosInCam - buttonSize/2 + offset
	button.size = buttonSize
	button.z_index = 1
	
	character.remove_child(button)
	add_child(button)

func swapCharacterFocus(character: Character):
	selectedCharacter.get_node("Deck").set_visibility(false)
	selectedCharacter = character
	selectedCharacter.get_node("Deck").set_visibility(true)

# Called when the node enters the scene tree for the first time.
func _ready():
#	Display enemy Health
	for target in targets.get_children():
#		target.get_node("Deck").set_visible(false)
		displayCharacterHP(target)
		displayCharacterButton(target)
	
#	Initialize PlayerUI
	player.get_node("Deck").set_visible(true)
	displayCharacterHP(player)
	displayCharacterButton(player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	User Commands
	if (Input.is_action_just_released("End_Turn")):
		$"../Character/Deck".endTurn()
		print("ending turn")
	pass
