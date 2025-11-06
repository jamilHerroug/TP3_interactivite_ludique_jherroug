extends Panel

var score = 0
@onready var panel_2: Panel = $Main_character/Panel2


func add_point():
	score += 1
	panel_2.text = "You collected " + str(score) + "coins."
