extends Control

@export var GameName = "Game"
@export var GameDesc = "No Description"
@export var GameExec = "Path"
@export var Publisher = "No one"
@export var Developer = "No one"
@export var GameBG = Texture
var metadict = {}
var gameid = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$ScrollContainer/HBoxContainer/Panel/name.text = GameName
	$ScrollContainer/HBoxContainer/GameInfo/ScrollContainer/HBoxContainer/Desc.text = "\nDescription: \n" + GameDesc
	$ScrollContainer/HBoxContainer/GameInfo/ScrollContainer/HBoxContainer/GameAuthor.text = "Developer: " + Developer
	$ScrollContainer/HBoxContainer/GameInfo/ScrollContainer/HBoxContainer/GamePublisher.text = "Publisher: " + Publisher
	$GameBG.texture = GameBG

func _on_button_pressed() -> void:
	Global._rungame(GameExec, [])

func _readmetadata(count):
	print("Loading metadata for GameID: " + str(count))
	gameid = count
	var file = FileAccess.open("user://metadata/" + str(count) + "/gameinfo.txt", FileAccess.READ)
	metadict = JSON.parse_string(file.get_as_text())
	GameName = metadict.GameName
	GameDesc = metadict.GameDesc
	GameExec = metadict.GameExec
	Publisher = metadict.Publisher
	Developer = metadict.Developer
	var image = Image.new()
	image.load("user://metadata/" + str(count) + "/GameBG.png")
	var texture=ImageTexture.create_from_image(image)
	GameBG = texture


func _on_change_path_pressed() -> void:
	$".".hide()
	$"..".CurMenu = "GD-ChangePath"
	$"../ExecPathChange".show()
	$"../ExecPathChange/AnimationPlayer".play("fadein")


func _on_edit_data_pressed() -> void:
	$".".hide()
	$"..".CurMenu = "GD-MetadataEditor"
	$"../MetadataEditor".show()
	$"../MetadataEditor/AnimationPlayer".play("fadein")
