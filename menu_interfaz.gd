extends CanvasLayer

signal start_game


func show_message(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$Timer.start()


func game_over():
	show_message("Game Over")
	await $Timer.timeout

	$Button.show()
	$Mensaje.text = "Revenange"
	$Mensaje.show()
	
func update_score(points):
	$ScoreLabel.text = str(points)


func _on_timer_timeout():
	$Mensaje.hide()
	


func _on_button_pressed():
	$Button.hide()
	emit_signal("start_game")
