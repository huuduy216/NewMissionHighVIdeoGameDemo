extends CanvasLayer

signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over(score):
	if (score < 35):
		show_message("Oh come on! You can do \nbetter than that.")
	elif (score < 120):
		show_message("You're not too bad...\nI guess")
	else:
		show_message("Wow, show me the way\n master!")
	yield(get_tree().create_timer(3.5), "timeout")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Try again?"
	$MessageLabel.show()
	$StartButton.show()


func update_score(score):
	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$MessageLabel.hide()
