extends Control

var item_data:Dictionary = {}

func _on_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_released():
		queue_free()
	pass # Replace with function body.

func set_info(data:Dictionary) -> void:
	item_data = data
	$MarginContainer2/LabelTitle.text = data["item_name"] + " *" + str(data["item_quantity"])
	$MarginContainer2/VBoxContainer/LabeTitle.text = data["item_name"]
	$MarginContainer2/VBoxContainer/LabelQuatity.text = _item_quatity_to_string(data["quality"])
	$MarginContainer2/VBoxContainer/LabelType.text = _item_type_to_string(data["item_type"])
	$MarginContainer2/VBoxContainer/LabelTips.text = data["tips"]
	$MarginContainer2/VBoxContainer/LabelDescription.text = data["description"]
	$MarginContainer2/VBoxContainer/LabelPrice.text = "单价：" + str(data["item_price"])

#品质
func _item_quatity_to_string(quatity:int) -> String:
	match quatity:
		0:
			return "品质： 普通"
		1:
			return "品质： 精致"
		2:
			return "品质： 稀有"
		3:
			return "品质： 史诗"
	return ""

#分类
func _item_type_to_string(item_type:int) -> String:
	match item_type:
		1:
			return "分类： 装备"
		2:
			return "分类： 消耗品"
		3:
			return "分类： 技能书"
	return ""
