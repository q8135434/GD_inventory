class_name InventoryManage extends Node

#添加只能存放装备的背包
var _equip_package:EquipInventory

var equip_package :EquipInventory:
	get:
		return _equip_package
	set(v):
		_equip_package = v
	
#添加只能存放道具的背包
var _prop_package:Inventory

var prop_package:Inventory:
	get:
		return _prop_package
	set(v):
		_prop_package = v

#添加只能存放技能书的背包
var _skill_package:Inventory

var skill_package:Inventory:
	get:
		return _skill_package
	set(v):
		_skill_package = v
