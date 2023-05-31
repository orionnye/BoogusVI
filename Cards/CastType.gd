extends Node

class_name CastType

var title: String
var icon = load("res://Art/Sprites/Icons/fruit.png")
var details: String
var cast: Callable

#Special Ability on each card that is evoked on use
var defaultCast: Callable = func baseCast(_caster: Character, _target: Character):
	print("default function, no effect")
	pass

func _init():
	self.title = "undefined title"
	self.details = "Unspecified Details"
	self.cast = defaultCast

func update():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
