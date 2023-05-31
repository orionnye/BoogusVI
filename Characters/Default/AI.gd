extends Character


func selectRandomCard():
	var hand = self.get_node("Deck/Hand")
	var cardCount = hand.get_cards().length()
	print("cardCount in Hand: ", cardCount)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
