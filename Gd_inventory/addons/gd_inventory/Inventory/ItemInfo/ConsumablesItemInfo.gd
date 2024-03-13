extends Control

#出售按钮
signal sale_pressed

var item_data:Dictionary = {}
var sale_quantity:int

func _ready() -> void:
	for index in GameData.players.size():
		var player = GameData.players[index]
		var button := Button.new()
		var text :String = player["char_name"] 
		text += "   hp：" + str(player["current_hp"]) + " / " + str(player["max_hp"])
		text += "   mp：" + str(player["current_mp"]) + " / " + str(player["max_mp"])
		button.text = text
		button.custom_minimum_size.y = 50
		button.pressed.connect(Callable(self,"touch_to_recover").bind(index))
		$VBoxContainer.add_child(button)

#
func set_info(data:Dictionary) -> void:
	item_data = data
	$MarginContainer2/LabelTitle.text = data["item_name"] + " *" + str(data["item_quantity"])
	$MarginContainer2/VBoxContainer/LabeTitle.text = data["item_name"]
	$MarginContainer2/VBoxContainer/LabelQuatity.text = _item_quatity_to_string(data["quality"])
	$MarginContainer2/VBoxContainer/LabelType.text = _item_type_to_string(data["item_type"])
	$MarginContainer2/VBoxContainer/LabelDescription.text = data["description"]
	$MarginContainer2/VBoxContainer/LabelTarget.text = "目标："+_target_to_string(data["target"]) 
	$MarginContainer2/VBoxContainer/LabelArea.text = "范围：" + _area_to_string(data["area"])
	$MarginContainer2/VBoxContainer/LabelPrice.text = "单价：" + str(data["item_price"])
	
	$MarginContainer2/HBoxContainer/HBoxContainer/HSlider.max_value = data["item_quantity"]
	
	
#关闭窗口
func _on_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_released():
		queue_free()
	pass # Replace with function body.

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

#目标
func _target_to_string(target:String) -> String:
	if target == "Team" :
		return "我方"
	else :
		return "敌方"

#范围
func _area_to_string(area:String) -> String:
	match area:
		"Single":
			return "单人"
			
	return ""


func _on_h_slider_value_changed(value: float) -> void:
	sale_quantity = int(value)
	$MarginContainer2/HBoxContainer/Label.text = str(sale_quantity)
	pass # Replace with function body.


func _on_button_pressed() -> void:
	$VBoxContainer.visible = false
	
	if sale_quantity <= 0:
		return
	var totle = item_data["item_price"] * sale_quantity

	#金币增加 单例直接调用
	GameData.coins = totle
	
	#UI物品减少 传值引用的，所以能直接扣减到后台
	item_data["item_quantity"] -= sale_quantity
	if item_data["item_quantity"] <= 0:
		#销毁自身
		GameData.gama_data["inventory"].erase(item_data)
		queue_free()
		pass
	else :
		update_item_quantity()
	sale_pressed.emit()
	pass # Replace with function body.

#更新物品数量 ui
func update_item_quantity() -> void:
	$MarginContainer2/LabelTitle.text = item_data["item_name"] + " *" + str(item_data["item_quantity"])
	$MarginContainer2/HBoxContainer/HBoxContainer/HSlider.value = 0
	$MarginContainer2/HBoxContainer/HBoxContainer/HSlider.max_value = item_data["item_quantity"]

#使用
func _on_button_use_pressed() -> void:
	$VBoxContainer.visible = !$VBoxContainer.visible
	pass # Replace with function body.

#点击人物名称  加血加蓝
func touch_to_recover(index:int) -> void:
	
	item_data["item_quantity"] -= 1
	
	for effect in item_data["effct"]:
		var class_path :String = "res://addons/gd_inventory/Inventory/ItemEffect/{path}.gd".format({"path":effect["effect_state"]})
		var _state_class = load(class_path).new(effect["effect_data"],index)

	#更新血量显示
	var player = GameData.players[index]
	var text :String = player["char_name"] 
	text += "   hp：" + str(player["current_hp"]) + " / " + str(player["max_hp"])
	text += "   mp：" + str(player["current_mp"]) + " / " + str(player["max_mp"])
	$VBoxContainer.get_child(index).text = text
	
	#更新物品数量
	update_item_quantity()
	#背包数量更新
	sale_pressed.emit()
	
	#减少物品数量
	if item_data["item_quantity"] <= 0:
		#销毁自身
		GameData.gama_data["inventory"].erase(item_data)
		queue_free()
