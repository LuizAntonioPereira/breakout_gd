extends KinematicBody2D


# Declare member variables here.
var direction = Vector2.ZERO
var x = 200
var y = 700
var yes = true

func _ready():
	Global.play = false	
	pass


func _process(delta):
	
	if Global.play == true and yes == true:
		direction = Vector2(x,y)
		yes = false			
	
	var col = move_and_collide(direction * delta)
	if col:
		var reflect = col.remainder.bounce(col.normal)
		direction = direction.bounce(col.normal)
		move_and_collide(reflect)

func _on_VisibilityNotifier2D_screen_exited():	
	#get_tree().reload_current_scene()
	get_tree().change_scene("res://scenes/game_over.tscn")

