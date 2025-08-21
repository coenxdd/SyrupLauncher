extends Control

var GameCount = 0
var SongCount = 0
var CurMenu = "Home"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Home.hide()
	$Home/AnimationPlayer.play("intro")
	var gamearray = DirAccess.get_directories_at("user://metadata")
	GameCount = gamearray.size()
	print("Found " + str(GameCount) + " Games")
	var dir = DirAccess.open("user://")
	if dir.file_exists("user://userbg.png"):
		$defaultbg.hide()
		$userbg.show()
		var image = Image.new()
		image.load("user://userbg.png")
		var texture2=ImageTexture.create_from_image(image)
		$userbg.texture = texture2
	var songarray = DirAccess.get_directories_at("user://music")
	SongCount = songarray.size()
	print("Found " + str(SongCount) + " Songs")
	Global.SongCount = SongCount



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_temp_name_mouse_entered() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("back") && Global.BackEnabled == true:
		if CurMenu == "GameList":
			$sfx/Back.play()
			$Home.show()
			CurMenu = "Home"
			$Home/AnimationPlayer.play("intro")
			$MyGames/AnimationPlayer.play("out")
			await get_tree().create_timer(0.2).timeout
			$MyGames.hide()
		elif CurMenu == "GameDetails":
			$sfx/Back2.play()
			$GameDetails.hide()
			$MyGames.show()
			CurMenu = "GameList"
			$MyGames/AnimationPlayer.play("in")
		elif CurMenu == "GD-ChangePath":
			$sfx/Back2.play()
			$GameDetails.show()
			CurMenu = "GameDetails"
			$ExecPathChange/AnimationPlayer.play("fadeout")
			await get_tree().create_timer(0.1).timeout
			$ExecPathChange.hide()
		elif CurMenu == "GD-MetadataEditor":
			$sfx/Back2.play()
			$GameDetails.show()
			CurMenu = "GameDetails"
			$MetadataEditor/AnimationPlayer.play("fadeout")
			await get_tree().create_timer(0.1).timeout
			$MetadataEditor.hide()
		if CurMenu == "MusicList":
			$sfx/Back.play()
			$Home.show()
			$MyMusic.RemoveList()
			CurMenu = "Home"
			$Home/AnimationPlayer.play("intro")
			$MyMusic/AnimationPlayer.play("out")
			await get_tree().create_timer(0.2).timeout
			$MyMusic.hide()
		elif CurMenu == "MusicPlayer":
			$sfx/Back2.play()
			$MyMusic.show()
			$MyMusic/AnimationPlayer.play("in")
			CurMenu = "MusicList"
			$MusicPlayer/AnimationPlayer.play("fadeout")
			await get_tree().create_timer(0.1).timeout
			$MusicPlayer.hide()
	if event.is_action_pressed("music") && Global.BackEnabled == true:
		CurMenu = "MusicList"
		$MyMusic.LoadSongsList()
		$sfx/Opening.play()
		$Home.hide()
		$MusicPlayer.hide()
		$MyGames.hide()
		$MetadataEditor.hide()
		$ExecPathChange.hide()
		$GameDetails.hide()
		$MyMusic.show()
		$Home.UpdateTileData()
		$MyMusic.position.x = -1162.46
		$MyMusic/AnimationPlayer.play("in")
		

func OpenMusic():
	$MyMusic.position.x = -1162.46
	$MyMusic/AnimationPlayer.play("in")
	$Home/AnimationPlayer.play("fadeout")
	CurMenu = "MusicList"
	$MyMusic.LoadSongsList()
	$sfx/Opening.play()
	$MyMusic.show()
	await get_tree().create_timer(0.3).timeout
	$Home.hide()
	$Home.UpdateTileData()
