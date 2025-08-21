extends Node

var username = "root"
var gs = 0
var BackEnabled = true
var SongCount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _newdict(number, json):
	var title = "GameInfo" + str(number)
	var dict = json
	print(dict)
	str_to_var(title)

func _rungame(path, args):
	get_tree().root.mode = Window.MODE_MINIMIZED
	var output = OS.execute(path, args)
	print(output)
