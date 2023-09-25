extends RigidBody2D


@export var Max_Speed : int
@export var Min_Speed : int
var tipo_enemigo = ["Murcielago" ,  "Mosquito"]

func _ready():
	$AnimatedSprite2D.animation = tipo_enemigo[randi() % tipo_enemigo.size()]
	


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
