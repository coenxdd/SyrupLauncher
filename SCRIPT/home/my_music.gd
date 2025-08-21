extends Control
 
signal ChangeName

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func LoadSongsList():
	RemoveList()
	$"..".CurMenu = "MusicList"
	var count = get_parent().SongCount
	print("Loaded " + str(count) + " Songs")
	var loopcount = 1
	for I in range(0,count):
		var thing = preload("res://SCENE/songlist.tscn").instantiate()
		$Panel/ScrollContainer/VBoxContainer.add_child(thing)
		$Panel/ScrollContainer/VBoxContainer/TempName.SongID = loopcount
		emit_signal("ChangeName")
		loopcount += 1

func PlaySong(id):
	$"..".CurMenu = "MusicPlayer"
	$"../sfx/SelectA(alt)".play()
	$"../MusicPlayer"._PlaySong(id)
	$".".hide()
	$"../MusicPlayer".show()
	$"../MusicPlayer/AnimationPlayer".play("fadein")

func RemoveList():
	for i in range(0, $Panel/ScrollContainer/VBoxContainer.get_child_count()):
		$Panel/ScrollContainer/VBoxContainer.get_child(i).queue_free()


func _on_go_to_music_player_pressed() -> void:
	$"..".CurMenu = "MusicPlayer"
	$"../sfx/SelectA(alt)".play()
	$AnimationPlayer.play("out")
	$"../MusicPlayer".show()
	$"../MusicPlayer/AnimationPlayer".play("fadein")
	await get_tree().create_timer(0.2).timeout
	$".".hide()
