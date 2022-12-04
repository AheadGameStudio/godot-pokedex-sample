extends Control

signal back

var _type_text:PackedStringArray = ["ノーマル","ほのお","みず","でんき","くさ","こおり","かくとう","どく","じめん","ひこう","エスパー","むし","いわ","ゴースト","ドラゴン","あく","はがね","フェアリー","None"]
var _type_scene:PackedScene = preload("res://type_icon.tscn")

var data:Dictionary:
	set(value):
		data = value
		%NumberLabel.text = "No." + "%0*d" % [3, data.no]
		%NameLabel.text = data.name
		%HeightLabel.text = str(data.height)
		%WeightLabel.text = str(data.weight)
		%NumBattleLabel.text = "0"
		%FormLabel.text = "dummy"
		%DescriptionLabel.text = data.description
		%PokemonIcon.texture = load("res://Sprites/" + data.sprite_name + ".png")
		%ClassLabel.text = data["class"]
		%IconGot.visible = !data.open_id < 2
		
		for child in %TypeContainer.get_node("Container").get_children():
			child.queue_free()
			
		for n in data.type.size():
			
			if data.type[n] == 0: continue
			var _ins = _type_scene.instantiate()
			_ins.text = _type_text[n]
			%TypeContainer.get_node("Container").add_child(_ins)
			
		
		
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		emit_signal("back")
