extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export (int) var speed


var is_stop = true

func set_stop(set):
	is_stop = set

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Ground0.position.x = 0
	$Ground1.position.x = 336
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if is_stop == false:
		$Ground0.position.x -= speed
		$Ground1.position.x -= speed
		
		if $Ground0.position.x <= -336:
			$Ground0.position.x = 336
		elif $Ground1.position.x <= -336:
			$Ground1.position.x = 336
	pass
