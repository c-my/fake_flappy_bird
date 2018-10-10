extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal start

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	hide_everything()
	pass
	
	
func show_start():
	$logo.show()
	$start_button.show()
	$rank_button.show()
	$score_label.hide()
	
func get_ready():
	$get_ready.show()	
	$score_label.show()

func hide_everything():
	$logo.hide()
	$game_over.hide()
	$get_ready.hide()
	$start_button.hide()
	$rank_button.hide()
	$score_label.hide()
	
func game_over():
	$game_over.show()
	$start_button.show()
	$rank_button.show()
	
func set_score(score):
	$score_label.text = str(score)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_start_button_pressed():
	emit_signal("start")
