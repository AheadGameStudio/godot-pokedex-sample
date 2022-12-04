extends MarginContainer

@onready var icon:TextureRect = $HBoxContainer/TextureRect
@onready var label:Label = $HBoxContainer/Label
var icon_path:String
var text:String

func _ready():
	icon.texture = load(icon_path)
	icon.ignore_texture_size = true
	icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	label.text = text
