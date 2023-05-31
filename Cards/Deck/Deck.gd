extends Node2D

class_name Deck

@onready var drawPile: Pile = $"Draw"
@onready var discardPile: Pile = $"Discard"
@onready var handPile: Pile = $"Hand"

func shuffle():
	pass

func isHandFull() -> bool:
	return false

func cardCycle():
	var cycleDelay = 0.5
	
	handPile.empty_into_inert(discardPile)
	print("emptied Hand Pile into Discard Pile")
	
	await get_tree().create_timer(cycleDelay).timeout
	drawPile.empty_into_active(handPile, true)
	print("filling Hand Pile from Draw Pile")

	if (handPile.cards.get_child_count() < handPile.maxCards):
		await get_tree().create_timer(cycleDelay).timeout
		print("Draw Pile empty, restocking from Discard Pile")
		discardPile.empty_into_inert(drawPile, true)
		
		await get_tree().create_timer(cycleDelay).timeout
		print("Draw Pile restocked, Discard Pile Empty, restocking Hand Pile")
		drawPile.empty_into_active(handPile, true)

func migrateCardToDiscard(card: Card):
	handPile.migrateCardTo(card, discardPile)

func endTurn():
	cardCycle()

#func is_card_selected() -> bool:
#	if (handPile.selectedCard != null):
#		return true
#	return false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
