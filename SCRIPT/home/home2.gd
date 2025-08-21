extends Control

var HomeTab = "home"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_my_games_mouse_entered() -> void:
	$"../sfx/Move".play()
	$Main/MyGames/AnimationPlayer.play("Up")


func _on_my_games_mouse_exited() -> void:
	$Main/MyGames/AnimationPlayer.play("Down")


func _on_btn_2_mouse_entered() -> void:
	$"../sfx/Move".play()
	$Main/Btn2/AnimationPlayer.play("Up")


func _on_btn_2_mouse_exited() -> void:
	$Main/Btn2/AnimationPlayer.play("Down")

func OpenGamesList():
	$"../sfx/Select".play()
	$"../MyGames".LoadGamesList()
	$AnimationPlayer.play("fadeout")
	await get_tree().create_timer(0.2).timeout
	UpdateTileData()
	$".".hide()
	$"../MyGames".position.x = -1162.46
	$"../MyGames/AnimationPlayer".play("in")
	$"../MyGames".show()

func _on_my_games_pressed() -> void:
	$"../MyGames".LoadGamesList()
	$"../sfx/Select".play()
	$Main/MyGames/AnimationPlayer.play("Down")
	$AnimationPlayer.play("fadeout")
	await get_tree().create_timer(0.2).timeout
	UpdateTileData()
	$".".hide()
	$"../MyGames".position.x = -1162.46
	$"../MyGames/AnimationPlayer".play("in")
	$"../MyGames".show()

func UpdateTileData():
	$Main/MiddleAd.pickrandomtile()
	$Main/RightAd1.pickrandomtile()
	$Main/RightAd2.pickrandomtile()
	$Video/MiddleAd.pickrandomtile()
	$Video/RightAd1.pickrandomtile()
	$Video/RightAd2.pickrandomtile()
	$Games/MiddleAd.pickrandomtile()
	$Games/RightAd1.pickrandomtile()
	$Games/RightAd2.pickrandomtile()
	$Music/MiddleAd.pickrandomtile()
	$Music/RightAd1.pickrandomtile()
	$Music/RightAd2.pickrandomtile()

func ChangeTab(TabName):
	$"../sfx/Slide".play()
	if TabName == "home":
		$Main.show()
		if HomeTab == "video":
			$Main/AnimationPlayer.play("in")
			$Video/AnimationPlayer.play("out_right")
			await get_tree().create_timer(0.3).timeout
			$Video.hide()
		if HomeTab == "games":
			$Main/AnimationPlayer.play("in")
			$Games/AnimationPlayer.play("out_right")
			await get_tree().create_timer(0.3).timeout
			$Games.hide()
		if HomeTab == "music":
			$Main/AnimationPlayer.play("in")
			$Music/AnimationPlayer.play("out_right")
			await get_tree().create_timer(0.3).timeout
			$Music.hide()
		HomeTab = "home"
	if TabName == "video":
		$Video.show()
		if HomeTab == "home":
			$Video/AnimationPlayer.play("in_right")
			$Main/AnimationPlayer.play("out")
			await get_tree().create_timer(0.3).timeout
			$Main.hide()
		if HomeTab == "games":
			$Video/AnimationPlayer.play("in")
			$Games/AnimationPlayer.play("out_right")
			await get_tree().create_timer(0.3).timeout
			$Games.hide()
		if HomeTab == "music":
			$Video/AnimationPlayer.play("in")
			$Music/AnimationPlayer.play("out_right")
			await get_tree().create_timer(0.3).timeout
			$Music.hide()
		HomeTab = "video"
	if TabName == "games":
		$Games.show()
		if HomeTab == "home":
			$Games/AnimationPlayer.play("in_right")
			$Main/AnimationPlayer.play("out")
			await get_tree().create_timer(0.3).timeout
			$Main.hide()
		if HomeTab == "video":
			$Games/AnimationPlayer.play("in_right")
			$Video/AnimationPlayer.play("out")
			await get_tree().create_timer(0.3).timeout
			$Video.hide()
		if HomeTab == "music":
			$Games/AnimationPlayer.play("in")
			$Music/AnimationPlayer.play("out_right")
			await get_tree().create_timer(0.3).timeout
			$Music.hide()
		HomeTab = "games"
	if TabName == "music":
		$Music.show()
		if HomeTab == "home":
			$Music/AnimationPlayer.play("in_right")
			$Main/AnimationPlayer.play("out")
			await get_tree().create_timer(0.3).timeout
			$Main.hide()
		if HomeTab == "video":
			$Music/AnimationPlayer.play("in_right")
			$Video/AnimationPlayer.play("out")
			await get_tree().create_timer(0.3).timeout
			$Video.hide()
		if HomeTab == "games":
			$Music/AnimationPlayer.play("in_right")
			$Games/AnimationPlayer.play("out")
			await get_tree().create_timer(0.3).timeout
			$Games.hide()
		HomeTab = "music"


func _on_home_pressed() -> void:
	ChangeTab("home")


func _on_video_pressed() -> void:
	ChangeTab("video")


func _on_my_videos_mouse_entered() -> void:
	$"../sfx/Move".play()
	$Video/MyVideos/AnimationPlayer.play("Up")


func _on_my_videos_mouse_exited() -> void:
	$Video/MyVideos/AnimationPlayer.play("Down")


func _on_video_btn_2_mouse_entered() -> void:
	$"../sfx/Move".play()
	$Video/btn2/AnimationPlayer.play("Up")


func _on_video_btn_2_mouse_exited() -> void:
	$Video/btn2/AnimationPlayer.play("Down")


func _on_games_pressed() -> void:
	ChangeTab("games")


func _on_music_pressed() -> void:
	ChangeTab("music")
