extends PanelContainer

@onready var _keyguide_scene:PackedScene = preload("res://KeyGuide.tscn")
@onready var _guide_container = $GuideContainer

var _keys:Array =  [
		{ "icon_path":"res://Textures/switch_control_B.png", "text":"Back" },
		{ "icon_path":"res://Textures/switch_control_A.png", "text":"OK" }
	]

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in _keys:
		var _ins = _keyguide_scene.instantiate()
		_ins.icon_path = i["icon_path"]
		_ins.text = i["text"]
		_guide_container.add_child(_ins)
