extends Control

var SongMetaData = "None"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if $"..".CurMenu == "MusicPlayer":
		$Panel/VBoxContainer/Metadata.text = SongMetaData
		$Panel/VBoxContainer/ProgressBar.value = $AudioStreamPlayer.get_playback_position()
		$Panel/VBoxContainer/ProgressBar.max_value = $AudioStreamPlayer.stream.get_length()

func _PlaySong(id):
	print("Playing Song ID: " + str(id))
	var file = FileAccess.open("user://music/" + str(id) + "/song.mp3", FileAccess.READ)
	var buffer = file.get_buffer(file.get_length())
	var audio_stream_mp3 = AudioStreamMP3.new()
	audio_stream_mp3.data = buffer
	$AudioStreamPlayer.stream = audio_stream_mp3
	var metadata = FileAccess.open("user://music/" + str(id) + "/songinfo.txt", FileAccess.READ)
	var metadict = JSON.parse_string(metadata.get_as_text())
	SongMetaData = metadict.Artist + "\n" + metadict.SongName
	var image = Image.new()
	image.load("user://music/" + str(id) + "/cover.png")
	var texture2=ImageTexture.create_from_image(image)
	$Panel/VBoxContainer/Panel/SongCover.texture = texture2
	$AudioStreamPlayer.play()


func _on_stop_pressed() -> void:
	$AudioStreamPlayer.stop()


func _on_forward_pressed() -> void:
	pass


func _on_volume_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		$Panel/VolumeSlider.show()
	else:
		$Panel/VolumeSlider.hide()


func _on_volume_slider_drag_ended(_value_changed: bool) -> void:
	$AudioStreamPlayer.volume_db = $Panel/VolumeSlider.value
