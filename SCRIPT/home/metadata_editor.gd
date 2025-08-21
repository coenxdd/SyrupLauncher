extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_done_pressed() -> void:
	$"../GameDetails".GameName = $Panel/GameName.text
	$"../GameDetails".Developer = $Panel/Developer.text
	$"../GameDetails".Publisher = $Panel/Publisher.text
	$"../GameDetails".GameDesc = $Panel/Description.text
	var metadata = {
		"GameName": $"../GameDetails".GameName,
		"GameExec": $"../GameDetails".GameExec,
		"GameDesc": $"../GameDetails".GameDesc,
		"Publisher": $"../GameDetails".Publisher,
		"Developer": $"../GameDetails".Developer,
	}
	print(metadata)
	var file = FileAccess.open("user://metadata/" + str($"../GameDetails".gameid) + "/gameinfo.txt", FileAccess.WRITE)
	file.store_line(JSON.stringify(metadata))
	$"..".CurMenu = "GameDetails"
	$"../GameDetails".show()
	$AnimationPlayer.play("fadeout")
	await get_tree().create_timer(0.1).timeout
	$".".hide()

func _on_boxfocus() -> void:
	Global.BackEnabled = false


func _on_boxnotfocus() -> void:
	Global.BackEnabled = true
