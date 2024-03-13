extends ColorRect

signal item_pressed

enum Quality {Whilte,Blue,Yello,Red}
enum ItemType {None,Equipment,Consumables,SkillBook}

var item_data:Dictionary
#var bag:Control

func set_label(data:Dictionary):
	item_data = data
	$LabelType.text = _get_item_type(item_data["item_type"])
	$Label2Name.text= item_data["item_name"]
	$Label3Quantity.text = str(item_data["item_quantity"])
	_get_quality(item_data["quality"])

func _get_quality(quality:int) :
	match quality:
		Quality.Whilte:
			color = Color.WHITE_SMOKE
			pass
		#Quality.Green:
			#color = Color.WEB_GREEN
			#pass
		Quality.Blue:
			color = Color.CADET_BLUE
			pass
		Quality.Yello:
			color = Color.ORANGE
			pass
		Quality.Red:
			color = Color.RED
			pass

func _get_item_type(item_type:int) -> String:
	match item_type:
		ItemType.None:
			return ""
		ItemType.Equipment:
			return "装备"
		ItemType.Consumables:
			return "消耗品"
		ItemType.SkillBook:
			return "技能书"
	return ""


func _on_gui_input(event: InputEvent) -> void:
	
	if event is InputEventScreenTouch and event.is_released() and not get_parent().scrolling:
		print("被点击了")
		item_pressed.emit()
	pass # Replace with function body.
