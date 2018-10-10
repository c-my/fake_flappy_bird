extends Node2D

var score = 0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	randomize()
	$HUD.show_start()
	
func start():
	score = 0
	$start_timer.start()
	$HUD.hide_everything()
	$HUD.get_ready()
	$Pillars.init_position()
	$ground.set_stop(false)
	$Bird.position = $start_position.position
	$Bird.show()

	
func game_over():
	$Bird/hit.play()
	$score_timer.stop()
	$Pillars.set_stop(true)
	$HUD.game_over()
#	$Bird.hide()
	$ground.set_stop(true)
	$Bird.set_flying(false)

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	$HUD.set_score(score)



func _on_start_timer_timeout():
	$HUD.hide_everything()
	$Bird.start($start_position.position)
	$Pillars.start()
	$score_timer.start()
	$HUD/score_label.show()
	$Bird.set_flying(true)


func _on_score_timer_timeout():
	score += 1
