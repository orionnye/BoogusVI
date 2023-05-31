extends Node2D

var hp: int
var mp: int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#healthBar needs pips for each point in health or maxHealth

func update(hpNew, mpNew):
	var textDisplay = self.get_node("RichTextLabel")
	textDisplay.text = str("HP: " + str(hpNew) + "/" + str(mpNew))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
#	use jitter here
	pass
