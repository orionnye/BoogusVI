extends Node

class_name CastTypes

var punch = CastType.new()
var heal = CastType.new()
var moonsWrath = CastType.new()

var library = {
	"punch": punch, "heal": heal,
	"moonsWrath": moonsWrath
}
func _init():
	print("I'm being called when a new library is made")
#Punch////////////////////////////////
	punch.set("title", "Punch")
	punch.set("details", "Target.HP -= 5")
	punch.cast = func(caster, target):
		target.hp -= 5
	punch.icon = load("res://Art/Sprites/Icons/claw.png")
#Heal/////////////////////////////////
	heal.set("title", "Heal")
	heal.set("details", "Target.HP += 5")
	heal.cast = func(caster, target):
		target.hp += 5
	heal.icon = load("res://Art/Sprites/Icons/repair.png")
#MoonsWrath//////////////////////////
	moonsWrath.set("title", "Moons Wrath")
	moonsWrath.set("details", "Target.HP -= Caster.mp - Caster.hp")
	moonsWrath.cast = func(caster, target):
		var missingHP = caster.mp - caster.hp
		target.hp -= missingHP
	moonsWrath.icon = load("res://Art/Sprites/Icons/warp.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
