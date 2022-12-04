extends Control

@onready var pokemon_list = %PokemonList
@onready var button = preload("res://PokedexButton.tscn")
@onready var got_poke_count = %GotPokeCount
@onready var found_poke_count = %FoundPokeCount2
@onready var list_poke_preview = %ListPokePreview
@onready var detail_poke_preview = %DetailPokePreview

var data:Dictionary
var sprite_dir = "res://Sprites/"

var entered_last_button:Button = null
var current_button_id:int

func _ready():
	$PokedexDetail.hide()
	var file = FileAccess.open("res://pokemon_data.json", 1)
	data = JSON.parse_string(file.get_as_text())
	
	for d in data:
		var btn = button.instantiate()
		pokemon_list.add_child(btn)
		btn.sprite_name = data[d].sprite_name
		match int(data[d].open_id):
			0:
				btn.pokemon_name = "?????"
				btn.pokemon_number = data[d].no
			1:
				btn.pokemon_name = data[d].name
				btn.pokemon_number = data[d].no
				
				btn.is_got = data[d].open_id
				found_poke_count.count += 1
			2:
				btn.pokemon_name = data[d].name
				btn.pokemon_number = data[d].no
				btn.is_got = data[d].open_id
				found_poke_count.count += 1
				got_poke_count.count += 1
				
	$PokedexDetail.back.connect(_on_back)
	$PokemonList.visibility_changed.connect(_grab_button)
	
	for i in pokemon_list.get_children():
		i.pressed.connect(_on_pressed_button.bind(i))
		i.focus_entered.connect(_on_focus_entered.bind(i))
		
	_grab_button()

func _grab_button():
	var _ins:Button
	if entered_last_button == null:
		_ins = pokemon_list.get_child(0)
	else:
		_ins = entered_last_button
	_ins.grab_focus()

func _on_back():
	if $PokedexDetail.visible:
		$PokemonList.show()
		$PokedexDetail.hide()
	
func _on_pressed_button(_btn):
	if data["d"+str(_btn.get_index() + 1)].open_id == 0: return
	$PokemonList.hide()
	$PokedexDetail.show()
	entered_last_button = _btn
	$PokedexDetail.data = data["d"+str(_btn.get_index() + 1)]
	%PokeModel.data = data["d"+str(_btn.get_index() + 1)]

func _on_focus_entered(_btn):
	current_button_id = _btn.get_index() + 1
	
	if not data["d"+str(current_button_id)].open_id == 0:
		%NoItem.hide()
	else:
		%NoItem.show()
		
	%PokeModel.data = data["d"+str(current_button_id)]
	if data["d"+str(current_button_id)].open_id == 0:
		%PokeModel.delete_model()
	
