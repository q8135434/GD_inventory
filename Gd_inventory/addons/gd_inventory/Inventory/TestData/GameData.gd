extends Node

var gama_data:
	get:
		return {
			"coins":coins,
			"golden":golden,
			"players":players,
			"inventory":inventory
		} 

var players:Array

var coins	:int:
	get:
		return coins
	set(v):
		coins = max(0,coins + v)
		#save_gama_data()
var golden	:int:
	get:
		return golden
	set(v):
		golden = max(0,golden + v)
		#save_gama_data()

var inventory := [
	{
		"item_id":"zb001",
		"item_name":"新手剑",
		"stackable":false,
		"item_texture":"",
		"item_price":50,
		"item_type":1,
		"item_quantity":1,
		"quality":0,
		"tips":"手持木盾和长剑，是正宗的新手套装。",
		"description":"攻击力：13-17
						命中：120
						效果：出手速度 +3
						效果：力量 +1
						需求：
						》等级 1 级
						》力量 1 点
						》敏捷 1 点",
		"effects":[
			{"min_weapon_damage":13},
			{"max_weapon_damage":17},
			{"physical_hit":120},
			{"speed":3},
			{"strength":1},
		],
		"require":[
			{"level":1},
			{"strength":1},
			{"dexterity":1},
		],
	},
	{
		"item_id":"zb002",
		"item_name":"雷斯林的法杖",
		"stackable":false,
		"item_texture":"",
		"item_price":50,
		"item_type":1,
		"item_quantity":1,
		"quality":1,
		"tips":"魔法师的牛逼武器",
		"description":"I'am a dabaicai"
	},
	{
		"item_id":"smys001",
		"item_name":"生命药水",
		"stackable":true,
		"item_texture":"",
		"item_price":50,
		"item_type":2,
		"item_quantity":1,
		"quality":2,
		"effct":[
			{"effect_state":"HealthIntIncrease","effect_data":300},
		],
		"target":"Team",
		"area":"Single",
		"description":"效果：生命值恢复300"
	},
	{
		"item_id":"smys002",
		"item_name":"金疮药",
		"stackable":true,
		"item_texture":"",
		"item_price":50,
		"item_type":2,
		"item_quantity":3,
		"quality":3,
		"effct":[
			{"effect_state":"HealthFloatIncrease","effect_data":1},
			{"effect_state":"ManaIntIncrease","effect_data":300},
		],
		"target":"Team",
		"area":"Single",
		"description":"效果：生命值恢复50%\n效果：魔法值恢复300"
	},
	{
		"item_id":"mfys001",
		"item_name":"魔法药水",
		"stackable":true,
		"item_texture":"",
		"item_price":50,
		"item_type":2,
		"item_quantity":10,
		"quality":3,
		"effct":[
			{"effect_state":"ManaIntIncrease","effect_data":100},
		],
		"target":"Team",
		"area":"Single",
		"description":"效果：魔法值恢复100"
	},
	{
		"item_id":"jns001",
		"item_name":"吸星大法",
		"stackable":false,
		"item_texture":"",
		"item_price":50,
		"item_type":3,
		"item_quantity":1,
		"quality":3,
		"description":"I'am a dabaicai"
	},
]

func _ready() -> void:
	players.append(frist_load_data())
	
func frist_load_data():
	var save_data := {
		"char_name":"林逸风",
		"max_hp":100,
		"current_hp":10,
		"max_mp":40,
		"current_mp":5,
		"level":1,
		"experience":0,
		"attribute_points":0,
		"profession":"Warrior",
		"attr":{
			"strength":10,
			"constitution":0,
			"dexterity":0,
			"agility":0,
			"intelligence":10,
			"perception":0
		},
		"skills":{},
		"equips":{},
		
	}
	return save_data
