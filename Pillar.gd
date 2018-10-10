extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed = 1
var interval = 180
var is_stop = true

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	init_position()
	hide()
	
	pass
	
func start():
	init_position()
	show()
	set_stop(false)
	
func set_stop(set):
	is_stop = set	

func stop():
	hide()

func init_position():
	$top_pillar0.position.x = 290
	$top_pillar0.position.y = -25
	$below_pillar0.position.x = 290
	$below_pillar0.position.y = 425
	
	$top_pillar1.position.x = 290 + interval
	$top_pillar1.position.y = randi() % 70
	$below_pillar1.position.x = 290 + interval
	$below_pillar1.position.y = $top_pillar1.position.y + 130 + 320
	
	$top_pillar2.position.x = 290 + 2 * interval
	$top_pillar2.position.y = randi() % 70
	$below_pillar2.position.x = 290 + 2 * interval
	$below_pillar2.position.y = $top_pillar2.position.y + 130 + 320

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if is_stop == false:
		$top_pillar0.position.x -= speed
		$below_pillar0.position.x -= speed
		
		$top_pillar1.position.x -= speed
		$below_pillar1.position.x -= speed
		
		$top_pillar2.position.x -= speed
		$below_pillar2.position.x -= speed
		
		if $top_pillar0.position.x < -70:
			$top_pillar0.position.x = $top_pillar2.position.x + interval
			$below_pillar0.position.x = $below_pillar2.position.x + interval
	
			$top_pillar0.position.y = randi() % 70
			$below_pillar0.position.y = $top_pillar0.position.y + 130 + 320
			
		
		if $top_pillar1.position.x < -70:
			$top_pillar1.position.x = $top_pillar0.position.x + interval
			$below_pillar1.position.x = $below_pillar0.position.x + interval
			
			$top_pillar1.position.y = randi() % 70
			$below_pillar1.position.y = $top_pillar1.position.y + 130 + 320
			
		if $top_pillar2.position.x < -70:
			$top_pillar2.position.x = $top_pillar1.position.x + interval
			$below_pillar2.position.x = $below_pillar1.position.x + interval
			
			$top_pillar2.position.y = randi() % 70
			$below_pillar2.position.y = $top_pillar2.position.y + 130 + 320
