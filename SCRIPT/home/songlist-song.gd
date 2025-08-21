@tool
extends Button

@export var SongID = 1
@export var SongName = "None"
@export var SongArtist = "None"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	name = "TempName"
	await $"../../../..".ChangeName
	getmetadata(SongID)
	name = str(SongID)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func getmetadata(id):
	var file = FileAccess.open("user://music/" + str(id) + "/songinfo.txt", FileAccess.READ)
	var dict = JSON.parse_string(file.get_as_text())
	SongName = dict.SongName
	SongArtist = dict.Artist
	var image = Image.new()
	image.load("user://music/" + str(id) + "/cover.png")
	var texture=ImageTexture.create_from_image(image)
	$".".icon = texture
	$".".text = SongName + " - " + SongArtist


func _on_pressed() -> void:
	$"../../../..".PlaySong(SongID)
