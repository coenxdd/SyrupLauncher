extends Control
 
signal ChangeName

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func LoadGamesList():
	RemoveList()
	$"..".CurMenu = "GameList"
	var count = get_parent().GameCount
	print("Loaded " + str(count) + " Games")
	var loopcount = 1
	for I in range(0,count):
		var thing = preload("res://SCENE/gamelist.tscn").instantiate()
		$Panel/ScrollContainer/VBoxContainer.add_child(thing)
		$Panel/ScrollContainer/VBoxContainer/TempName.GameID = loopcount
		emit_signal("ChangeName")
		loopcount += 1

func OpenGameDetails(id):
	$"..".CurMenu = "GameDetails"
	$"../sfx/SelectA(alt)".play()
	$"../GameDetails"._readmetadata(id)
	$AnimationPlayer.play("out")
	await get_tree().create_timer(0.4).timeout
	$".".hide()
	$"../GameDetails".show()

func RemoveList():
	for i in range(0, $Panel/ScrollContainer/VBoxContainer.get_child_count()):
		$Panel/ScrollContainer/VBoxContainer.get_child(i).queue_free()
