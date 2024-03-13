extends GridContainer

var gird = preload("res://addons/gd_inventory/Inventory/InventoryGui/ItemColorRect.tscn")

#@export var bag:Control
##滑动中
var scrolling :bool
#当前tabbar索引
var current_tabbar:int

func _ready() -> void:
	set_item_gird(GameData.gama_data["inventory"])

#接收tabar索引
func receive_tabar_index(tab: int) -> void:
	current_tabbar = tab
	if tab == 0:
		set_item_gird(GameData.gama_data["inventory"])
		return
	#组装新数组
	var temp_arr :Array = []
	for item in GameData.gama_data["inventory"]:
		if  item["item_type"] == tab:
			temp_arr.append(item)
	
	set_item_gird(temp_arr)
			

#
func set_item_gird(items:Array):
	for child in get_children():
		child.queue_free()
	
	await get_tree().create_timer(.1).timeout
	
	for index in items.size():
		var item = items[index]
		var item_gird = gird.instantiate()   
		item_gird.set_label(item)
		#item_gird.bag = bag
		item_gird.item_pressed.connect(Callable(owner,"display_item_info").bind(item))
		add_child(item_gird)


func _on_scroll_container_scroll_ended() -> void:
	scrolling = false
	print("移动结束")
	pass # Replace with function body.


func _on_scroll_container_scroll_started() -> void:
	print(owner)
	scrolling = true
	print("移动开始")
	pass # Replace with function body.
