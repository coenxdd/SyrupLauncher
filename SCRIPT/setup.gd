extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dir = DirAccess.open("user://")
	if not dir.dir_exists("user://metadata"):
		startsetup()
	else:
		await get_tree().create_timer(0.1).timeout
		await get_tree().process_frame
		get_tree().change_scene_to_file("res://SCENE/home/home.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func startsetup():
	$Control/AnimationPlayer.play("fadein")
	await get_tree().create_timer(1).timeout
	var dir = DirAccess.open("user://")
	if not dir.dir_exists("user://metadata"):
		dir.make_dir("user://metadata")
		print("Created metadata folder")
	$Control/Panel/ProgressBar.value = 30
	if not dir.dir_exists("user://tilead"):
		dir.make_dir("user://tilead")
		print("Created tilead folder")
		await get_tree().create_timer(0.25).timeout
		$Control/Panel/ProgressBar.value = 40
		dir.make_dir("user://tilead/homemiddlead")
		print("Created homemiddlead folder")
		await get_tree().create_timer(0.25).timeout
		$Control/Panel/ProgressBar.value = 45
		dir.make_dir("user://tilead/videoadmiddle")
		print("Created videoadmiddle folder")
		await get_tree().create_timer(0.25).timeout
		$Control/Panel/ProgressBar.value = 50
		dir.make_dir("user://tilead/squaread")
		print("Created squaread folder")
		await get_tree().create_timer(0.25).timeout
		$Control/Panel/ProgressBar.value = 55
		dir.make_dir("user://music")
		print("Created music folder")
		await get_tree().create_timer(0.25).timeout
		$Control/Panel/ProgressBar.value = 60
		dir.make_dir("user://video")
		print("Created video folder")
	$Control/Panel/ProgressBar.value = 100
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://SCENE/home/home.tscn")
