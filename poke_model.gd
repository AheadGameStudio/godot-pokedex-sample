extends Node3D

var data:Dictionary:
	set(value):
		data = value
		delete_model()
		model = load("res://Models/" + value.sprite_name + ".tscn").instantiate()
		if data.open_id > 0:
			add_child(model)
		
var model:MeshInstance3D

func delete_model():
	if is_instance_valid(model):
		model.queue_free()
