extends PanelContainer

#["ノーマル","ほのお","みず","でんき","くさ","こおり","かくとう","どく","じめん","ひこう","エスパー","むし","いわ","ゴースト","ドラゴン","あく","はがね","フェアリー","None"]
var styles:Dictionary = {
					"normal": preload("res://TypeStyles/Normal.tres"),
					"fire": preload("res://TypeStyles/Fire.tres"),
					"grass": preload("res://TypeStyles/Grass.tres"),
					"posion": preload("res://TypeStyles/Poison.tres"),
					"air": preload("res://TypeStyles/Air.tres")
					}
var text :String:
	set(value):
		text = value
		$Label.text = value
		match value:
			"ほのお":
				$Label.add_theme_stylebox_override("normal", styles["fire"])
			"くさ":
				$Label.add_theme_stylebox_override("normal", styles["grass"])
			"どく":
				$Label.add_theme_stylebox_override("normal", styles["posion"])
			"ひこう":
				$Label.add_theme_stylebox_override("normal", styles["air"])
			_:
				$Label.add_theme_stylebox_override("normal", styles["normal"])
