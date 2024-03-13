extends Control

const item_colorRect   = preload("res://addons/gd_inventory/Inventory/InventoryGui/ItemColorRect.tscn")
const consumables_info = preload("res://addons/gd_inventory/Inventory/ItemInfo/ConsumablesItemInfo.tscn")
const equip_info       = preload("res://addons/gd_inventory/Inventory/ItemInfo/EquipItemInfo.tscn")

var tabbar_index :int

#func _ready() -> void:
	#$MarginContainer/ScrollContainer/ItemGridContainer.set_item_gird(items)
		##add_child(item_colorRect)

func _on_tab_bar_tab_changed(tab: int) -> void:
	tabbar_index = tab
	$MarginContainer/ScrollContainer/ItemGridContainer.receive_tabar_index(tab)
	pass # Replace with function body.


func _on_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_released():
		get_tree().quit()
	pass # Replace with function body.


#展示 物品详情
func display_item_info(item:Dictionary) -> void:
	match item["item_type"]:
		1:
			#装备
			var item_info_gui := equip_info.instantiate()
			item_info_gui.set_info(item)
			add_child(item_info_gui)
			pass
		2:
			#消耗品
			var item_info_gui := consumables_info.instantiate()
			item_info_gui.set_info(item)
			item_info_gui.sale_pressed.connect(Callable($MarginContainer/ScrollContainer/ItemGridContainer,"receive_tabar_index").bind(tabbar_index))
			add_child(item_info_gui)
			pass
		3:
			#技能书
			pass
	


func _on_button_pressed() -> void:
	var item_data := {
		"item_id":"mfys001",
		"item_name":"魔法药水",
		"stackable":true,
		"item_texture":"",
		"item_price":50,
		"item_type":2,
		"item_quantity":10,
		"quality":3,
		"effct":[
			{"effect_state":"ManaIncrease","effect_data":100},
		],
		"target":"Team",
		"area":"Single",
		"description":"效果：魔法值值恢复100"
	}
	
	#
	for index in GameData.inventory.size():
		var item :Dictionary= GameData.inventory[index]
		if item["item_id"] == item_data["item_id"] and item["stackable"]:
			item["item_quantity"] += item_data["item_quantity"]
			$MarginContainer/ScrollContainer/ItemGridContainer.receive_tabar_index(tabbar_index)
			return
	GameData.inventory.append(item_data)
	$MarginContainer/ScrollContainer/ItemGridContainer.receive_tabar_index(tabbar_index)
	pass # Replace with function body.
