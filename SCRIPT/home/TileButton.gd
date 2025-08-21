extends Button

@export var Type = "null"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	$"../../../sfx/Move".play()
	$AnimationPlayer.play("Up")


func _on_mouse_exited() -> void:
	$AnimationPlayer.play("Down")

func Open(function):
	if function == "GamesList":
		$"../..".OpenGamesList()
	if function == "MyMusic":
		$"../../..".OpenMusic()

func _on_pressed() -> void:
	$AnimationPlayer.play("Down")
	if Type == "MyGames":
		Open("GamesList")
	if Type == "MyMusic":
		Open("MyMusic")
		
