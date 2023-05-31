extends Node2D

class_name Pile

@export var offset = Vector2(1, 1)
@export var dimensions = Vector2(75, 100)
@export var startCount = 0
@export var maxCards = 10
@export var visiblePileMarker: bool = true
@export var cardCorrectionSpeed = 0.5

@onready var cardScene = load("res://Cards/Card/Card.tscn")
@onready var cards: Node2D = $"./Cards/"
@onready var selectedCard: Card = null


#CARD ADDITION! adding cards
func addCards(count):
	for i in count:
		var cardCopy = cardScene.instantiate()
		cards.add_child(cardCopy)
func addCastType(castType: CastType, count: int = 1):
	for i in count:
		var card: Card = cardScene.instantiate()
		card.castType = castType
		cards.add_child(card)

#CARD Migration! moving cards between piles
func migrateCardTo(card: Card, pile: Pile, dirty: bool = false):
#	Position Reset for Smooth translation
	var parentOffset = pile.position - self.position
	card.position -= parentOffset
	
#	Dirty Rotation and Translation
	if (dirty):
		var Dirty_Rotation = randf_range(-0.5, 0.5)
		var Dirty_Offset = Vector2(randf_range(-20, 20), randf_range(-20, 20))
		card.rotation = Dirty_Rotation
		card.offset = Dirty_Offset
#	Card Migration
	self.cards.remove_child(card)
	pile.cards.add_child(card)
	
func empty_into_inert(pile, clean: bool = false, _count: int = 5):
	print("emptying")
	self.selectedCard = null
	
	for child in self.cards.get_children():
		if ( pile.cards.get_children().size() < pile.maxCards ):
#			Value Reset for inert piles
			migrateCardTo(child, pile)
			if (clean):
				child.offset = Vector2(0, 0)
				child.rotation = 0

func empty_into_active(pile, dirty: bool = false, _count: int = 5):
	print("emptying")
	self.selectedCard = null
#	deselectCards()
	
	for child in self.cards.get_children():
		if ( pile.cards.get_children().size() < pile.maxCards ):
#			Disables click detection on inert piles
#			child.get_node("MeshInstance2D").visible = true
#			Card Migration
			migrateCardTo(child, pile, dirty)

#Card and Data Retrieval!
#-------CARD ACCESS-------!
func get_cards() -> Array[Node]:
	return cards.get_children()
#func selectCard(select: Card):
#	print("selectingcard!!!")
#	self.selectedCard = select
#func deselectCards():
#	self.selectedCard = null

#CARD MUTATIONS!
func update_Pile():
#	print("Cards Length", cards.get_children().size())
	var index = 0
	var moveSpeed: float = cardCorrectionSpeed
	for card in cards.get_children():
		var ideal_position = offset*index + card.offset
		var distance = ideal_position - card.position
#		only updates pos of cards not selected
		card.z_index = 0
		card.position = card.position + distance * moveSpeed
#		if (card.hovered):
#			card.z_index = 1
		index += 1
#	Update the card total text display
	$"CardTotal".text = str(cards.get_child_count())
#		print("card: ", card)


# Called when the node enters the scene tree for the first time.
func _ready():
#	addCards(startCount)
	update_Pile()
	$"PileMarker".visible = visiblePileMarker

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	update_Pile()
