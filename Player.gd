extends Area2D

@export var Speed : int

var Movement = Vector2()
var limite
signal beat


func _ready(): #Start
	hide()
	limite = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): #Update
	Movement = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		Movement.x += 1
	if Input.is_action_pressed("ui_left"):
		Movement.x -= 1
	if Input.is_action_pressed("ui_down"):
		Movement.y += 1
	if Input.is_action_pressed("ui_up"):
		Movement.y -= 1

	if Movement.length()>0: #diagonales normalizadas
		Movement = Movement.normalized() * Speed
		
	position += Movement * delta
	position.x = clamp(position.x, 10, limite.x)
	position.y = clamp(position.y, 10, limite.y)
	
	if Movement.x != 0:
		$AnimatedSprite2D.animation = "Horizontal"
		$AnimatedSprite2D.flip_h = Movement.x < 0
		$AnimatedSprite2D.flip_v = false
	elif Movement.y != 0:
		$AnimatedSprite2D.animation = "Vertical"
		$AnimatedSprite2D.flip_v = Movement.y > 0
	else:
		$AnimatedSprite2D.animation = "DeFrente"
		$AnimatedSprite2D.flip_v = false
	
	


func _on_body_entered(body):
	hide()
	emit_signal("beat")
	$CollisionShape2D.disabled = true
	
func start_game(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
