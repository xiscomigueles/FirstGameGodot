extends Node

@export var Enemigo : PackedScene
var Score




func _ready():
	randomize() 
	$MenuInterfaz/ScoreLabel.text = Time.get_time_string_from_system()


func new_game():
	Score = 0
	$Player.start_game($Marker2D.position)
	$StartTimerGame.start()
	$MenuInterfaz.show_message("Go!")
	$MenuInterfaz.update_score(Score)
	$AudioMuerte.play()
	$Musica.play()
	$Name.visible = false


func _on_player_beat_game_over():
	$ScoreTimer.stop()
	$EnemiesTimer.stop()
	$MenuInterfaz.game_over()
	$Name.visible = true
	$Musica.stop()
	$AudioGameOver.play()


func _on_start_timer_game_timeout():
	$ScoreTimer.start()
	$EnemiesTimer.start()


func _on_score_timer_timeout():
	Score +=1
	$MenuInterfaz.update_score(Score)


func _on_enemies_timer_timeout():
	#selecciona un lugar aleatorio en el camino
	$Camino/EnemigoPosition.set_progress(randi())

	var e = Enemigo.instantiate()
	add_child(e)
	var direccion = $Camino/EnemigoPosition.rotation + PI/2
	
	e.position = $Camino/EnemigoPosition.position
	direccion += randf_range(-PI/4 , PI/4)
	e.rotation = direccion
	e.set_linear_velocity(Vector2(randf_range(e.Min_Speed, e.Max_Speed), 0).rotated(direccion))
	
	
	
	
	
	
	
