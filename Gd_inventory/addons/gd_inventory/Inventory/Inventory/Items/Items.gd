class_name Items extends Node

#用来实现多态、抽象架构的类树基类
#基类不需要实现，所以可以定义为抽象的
	
#名称
var _name :String

var item_name:String:
	get:
		return _name
	set(v):
		_name = v
	
#描述
var _info:String

var item_info:String:
	get:
		return _info
	set(v):
		_info = v
	
#数量
var _quantity:int

var quantity:int:
	get:
		return _quantity
	set(v):
		_quantity = v
		
#构造函数
func _init(_item_name:String,_item_quantity:int,_item_info:String) -> void:
	_name		 = _item_name
	_quantity	 = _item_quantity
	_info 		 = _item_info

