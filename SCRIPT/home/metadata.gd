extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var metadata = {
		"GameName": "Castle Crashers",
		"GameExec": "/Users/coen/Applications/Castle Crashers.app/Contents/MacOS/run.sh",
		"GameDesc": "This four player RPG adventure will let you hack, slash, and smash your way to victory. Featuring hand-drawn characters, Castle Crashers delivers unique hi-res illustrated visuals and intense gameplay action. Play with up to three friends and discover mind-boggling magic and mystery in the amazing world created just for you!",
		"Publisher": "The Behemoth",
		"Developer": false,
	}
	print(metadata)
	var file = FileAccess.open("user://test.txt", FileAccess.WRITE)
	file.store_line(JSON.stringify(metadata))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
