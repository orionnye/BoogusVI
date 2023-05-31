extends StaticBody2D

class_name Card

#Paren References, TABOO
@onready var deck: Deck = get_parent().get_parent().get_parent()

var offset = Vector2(0, 0)
var value = "5"

var castType: CastType = CastType.new()

#mouse props
var hovered: bool = false

#------Card Function--------//////////////////////
func _call(caster: Character, target: Character):
#	Card Functionality
	castType.cast.call(caster, target)
#	Forced CardCycle
	deck.migrateCardToDiscard(self)

func _init():
	value = "0"

#-----Utility---------///////////////////////
func follow_point(point: Vector2):
	var followSpeed = 0.9
	var distance = point - position
	self.position += distance*followSpeed

func selected() -> bool:
	var pile = get_parent().get_parent()
	if (pile != null):
		if (pile.selectedCard == self):
			return true
	return false

#-----UI------////////////////////////////////////////
func _on_mesh_instance_2d_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			var pile = get_parent().get_parent()
			if (pile is Pile):
				pile.selectedCard = self

func _on_mesh_instance_2d_mouse_entered():
	self.hovered = true
func _on_mesh_instance_2d_mouse_exited():
	self.hovered = false


# Called when the node enters the scene tree for the first time.//////////////////
func _ready():
	$"Details".text = castType.details
	$"CardLabel".text = castType.title
	#asign cardIcon Here
	$"Icon".set_texture(castType.icon)
# Called every frame. 'delta' is the elapsed time since the previous frame./////////////
func _process(_delta):
#	Scaling constants
	const SCALE_NORM = Vector2(1, 1)
	const SCALE_GOAL = Vector2(1.4, 1.4)
	const SCALE_SPEED = Vector2(0.1, 0.1)
#	Offset constants
	const SELECTED_OFFSET_Y = -40
	const OFFSET_SPEED = 0.2
#	Rotation Constants
	const CORRECTION_SPEED = 0.6

	if (hovered || selected()):
#		Selected Scaling
		var scaleDiff = SCALE_GOAL - self.scale
		self.scale += scaleDiff*SCALE_SPEED
#		Selected Translation
		var yDiff = SELECTED_OFFSET_Y - self.position.y
		self.position.y += yDiff*OFFSET_SPEED
#		Rotation Correction
		if (self.rotation != 0):
			self.rotation = self.rotation*CORRECTION_SPEED
		if (offset.x != 0 && offset.y != 0):
			offset = offset*CORRECTION_SPEED

	if (!selected()):
#		De-Selected Scaling
		var scaleDiff = SCALE_NORM - self.scale
		self.scale += scaleDiff*SCALE_SPEED
#		De-Selected Translation
		var yDiff = self.position.y
		self.position.y += yDiff*OFFSET_SPEED
