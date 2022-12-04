extends Button

@export var is_got:int:
	set(value):
		is_got = int(value)
		match int(value):
			0:
				%TextureRect.visible = false
				%Sprite2D.visible = false
				disabled = true
			1:
				%TextureRect.visible = false
				%Sprite2D.visible = true
			2:
				%TextureRect.visible = true
				%Sprite2D.visible = true

var sprite_name:String:
	set(value):
		sprite_name = value
		%Sprite2D.texture = load("res://Sprites/" + value + ".png")

const tex_arr:PackedStringArray = [
	"res://Textures/Icon_found.png",
	"res://Textures/Icon_got1.png",
	"res://Textures/Icon_got2.png"
	]

var pokemon_name:String:
	set(value):
		pokemon_name = value
		%NameLabel.text = pokemon_name
		
var pokemon_number:int:
	set(value):
		pokemon_number = value
		%NumberLabel.text = "No." + "%0*d" % [3, pokemon_number]

var got_tex:Array
	
func _ready():
	%TextureRect.texture = load(tex_arr[2])
	self.focus_entered.connect(_on_focus_entered.bind(true))
	self.focus_exited.connect(_on_focus_entered.bind(false))

func _on_focus_entered(_visible:bool):
	$Background.visible = _visible
	%Cursor.visible = _visible
	var col = Color.BLACK if not _visible else Color.WHITE
	%TextureRect.modulate = col
