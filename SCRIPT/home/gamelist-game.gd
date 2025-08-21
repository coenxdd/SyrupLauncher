@tool
extends Button

@export var GameID = 1
@export var GameName = "None"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	name = "TempName"
	await $"../../../..".ChangeName
	getmetadata(GameID)
	name = str(GameID)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$".".text = GameName

func getmetadata(id):
	var file = FileAccess.open("user://metadata/" + str(id) + "/gameinfo.txt", FileAccess.READ)
	var dict = JSON.parse_string(file.get_as_text())
	GameName = dict.GameName
	var image = Image.new()
	image.load("user://metadata/" + str(id) + "/icon.png")
	var texture=ImageTexture.create_from_image(image)
	$".".icon = texture


func _on_pressed() -> void:
	$"../../../..".OpenGameDetails(GameID)
