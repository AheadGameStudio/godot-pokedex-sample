extends MarginContainer

@export var count:int:
	set(value):
		count = value
		%Label.text = "%0*d" % [3, count]

@export var is_got:bool = false
const tex_arr:PackedStringArray = [
	"res://Textures/Icon_found.png",
	"res://Textures/Icon_got1.png"
	]

func _ready():
	%TextureRect.texture = load(tex_arr[int(is_got)])

