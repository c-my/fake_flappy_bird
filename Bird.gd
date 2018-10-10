extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var fly_count = 0
var velocity = Vector2()
var is_flying = false
signal dead

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	hide()
	$CollisionPolygon2D.disabled = true
	$AudioStreamPlayer.stop()
	pass
	
func start(pos):
	velocity.y = 0
	position = pos
	show()
	$CollisionPolygon2D.disabled = false
	is_flying = true
	
func set_flying(set):
	is_flying = set
	

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	if is_flying == true:
		velocity.y += 0.4
		if Input.is_action_just_pressed("ui_up") or Input.is_key_pressed(KEY_BACKSPACE) :
			velocity.y = -7
	
			fly_count = 8
	#		move_and_collide(Vector2(0, -20))
			$Bird_action.play()
			$AudioStreamPlayer.play()
	
		elif fly_count != 0:
			fly_count -= 1
	#		applied_force.y = 0
		else:
			
	#		move_and_collide(Vector2(0, 2))
	#		velocity.y = 3
			$Bird_action.stop()
		position.y += velocity.y




func _on_Bird_body_entered(body):
	$CollisionPolygon2D.disabled = true
	emit_signal("dead")
	is_flying = false


func _on_VisibilityNotifier2D_screen_exited():
	if is_flying == true:
		$CollisionPolygon2D.disabled = true
		emit_signal("dead")
		is_flying = false
