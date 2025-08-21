extends TextureRect

@export var AdType = "homemiddlead"
@export var TitleEnabled = true
@export var AdTitle = Node
@export var AdDesc = Node
@export var ShadowEnabled = true
var ImgCount = 0
var SongCount = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if AdType == "songad":
		var songarray = DirAccess.get_directories_at("user://music")
		SongCount = songarray.size()
	else:
		var array = DirAccess.get_directories_at("user://tilead/" + AdType)
		ImgCount = array.size()
	#print("ImgCount: " + str(ImgCount))
	pickrandomtile()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func pickrandomtile():
	if AdType == "songad":
		var dir = DirAccess.open("user://")
		if not dir.dir_exists("user://music/1"):
			$adtitle.text = "No Songs found"
			$addesc.text = "Please add songs to the music folder."
		else:
			var id = randi_range(1, SongCount,)
			var image = Image.new()
			image.load("user://music/" + str(id) + "/cover.png")
			var texture2=ImageTexture.create_from_image(image)
			$".".texture = texture2
			if TitleEnabled == true:
				var file = FileAccess.open("user://music/" + str(id) + "/songinfo.txt", FileAccess.READ)
				var dict = JSON.parse_string(file.get_as_text())
				AdTitle.text = dict.SongName
				AdDesc.text = dict.Artist
	else:
		var dir = DirAccess.open("user://")
		if not dir.dir_exists("user://tilead/" + AdType + "/1"):
			$adtitle.text = "No Tiledata found"
			$addesc.text = "Please add tile data in " + AdType
		else:
			var id = randi_range(1, ImgCount,)
			var image = Image.new()
			image.load("user://tilead/" + AdType + "/" + str(id) + "/" + str(id) + ".png")
			var texture2=ImageTexture.create_from_image(image)
			$".".texture = texture2
			if TitleEnabled == true:
				var file = FileAccess.open("user://tilead/" + AdType + "/" + str(id) + "/" + str(id) + ".txt", FileAccess.READ)
				var dict = JSON.parse_string(file.get_as_text())
				AdTitle.text = dict.Title
				AdDesc.text = dict.Desc
				if dict.Shadow == false:
					ShadowEnabled = false
					$fade.hide()
				else:
					ShadowEnabled = true
					$fade.show()
		
