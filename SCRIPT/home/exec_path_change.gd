extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	$"../GameDetails".GameExec = $Panel/TextEdit.text
	var metadata = {
		"GameName": $"../GameDetails".GameName,
		"GameExec": $Panel/TextEdit.text,
		"GameDesc": $"../GameDetails".GameDesc,
		"Publisher": $"../GameDetails".Publisher,
		"Developer": $"../GameDetails".Developer,
	}
	print(metadata)
	var file = FileAccess.open("user://metadata/" + str($"../GameDetails".gameid) + "/gameinfo.txt", FileAccess.WRITE)
	file.store_line(JSON.stringify(metadata))
	$"..".CurMenu = "GameDetails"
	$AnimationPlayer.play("fadeout")
	await get_tree().create_timer(0.1).timeout
	$".".hide()
	$"../GameDetails".show()
