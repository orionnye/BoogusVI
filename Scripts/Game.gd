extends Node2D

var battle = preload("res://Events/Battle.tscn").instantiate()

func _on_button_pressed():
	get_tree().get_root().add_child(battle)
	get_tree().get_root().remove_child(self)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
