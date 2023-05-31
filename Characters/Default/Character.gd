extends Node3D

class_name Character

#Character Health Variables
#Max health Points(mp)
@export var mp = 10
#Health Points(hp)
@export var hp = mp
#Team affiliation
@export var team = "Neutral"
@export var speed = 1

#UI
@onready var healthBar = get_node("HealthBar")
signal clicked(unit)
var hovered: bool = false

#Deck
@onready var deck: Deck = get_node("Deck")

#library
@onready var library = CastTypes.new().library

#Child Access
@onready var mesh = self.get_node("characterMesh")

var battleIndex = 0
#Parent access, not optimal
#@onready var team: Team = get_parent()
#@onready var battle: Battle = team.get_parent()

func _init():
#	var rng = RandomNumberGenerator.new()
	var _meshes: Array[Resource] = [
#		load("res://Art/Models/Barrel_Shelf.obj"),
		load("res://Art/Models/JackHammer.obj"),
		load("res://Art/Models/MudGolemN1.obj"),
		load("res://Art/Models/Rock.obj"),
		load("res://Art/Models/Shovel.obj"),
		load("res://Art/Models/wheelBarrow.obj")
	]
	
#	var randMesh = MeshInstance3D.new()
#	randMesh.set_mesh(meshes[randi_range(0, meshes.size() - 1)])
#	self.add_child(randMesh)
#	self.remove_child(mesh)
	
	self.hp = 10
	self.mp = 10

func deselectCards():
	var hand: Pile = self.get_node("Deck/Hand")
	hand.selectedCard = null
func get_selectedCard():
	return deck.get_node("Hand").selectedCard

func selected() -> bool:
	var battle: Battle = get_parent().get_parent()
	if (battle != null):
		if (battle.selectedChar == self):
			return true
	return false

#func deselectSelf():
#	self.hideUI()
#	self.isSelected = false
#	if (team != null):
#		team.deselectUnit()
#func selectSelf():
#	self.showUI()
#	self.isSelected = true
##	Parent Reference, TABOO
#	if (team != null):
#		team.selectUnit(self)
#func _button_pressed():
##	var caster = get_parent().get_parent().activeCharacter
##	var hand = caster.get_node("Deck/Hand")
##	var selectedCard = hand.get_selected_card()
#	print("Jaboogah")
##	var target = self
##	if (selectedCard != null):
##		selectedCard._call(caster, self)
##	print("Function assigned from character")


#User Input, Click
func _on_area_3d_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			clicked.emit(self)
			pass
func _on_area_3d_mouse_entered():
	pass # Replace with function body.
func _on_area_3d_mouse_exited():
	pass # Replace with function body.


# ------- Render Functions --------
func repositionHealthBar(cam):
	var charPosInCam = cam.unproject_position(global_position)
	var offset = Vector2(-100, 180)
	healthBar.position = (charPosInCam + offset)
func showUI():
	deck.visible = true
#	healthBar.visible = true
func hideUI():
	deck.visible = false
#	healthBar.visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var drawPile = get_node("Deck/Draw")
#	Card type init
	drawPile.addCastType(library.get("punch"), 2)
	drawPile.addCastType(library.get("heal"), 2)
	drawPile.addCastType(library.get("moonsWrath"), 1)
	drawPile.addCards(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	healthBar.update(hp, mp)
