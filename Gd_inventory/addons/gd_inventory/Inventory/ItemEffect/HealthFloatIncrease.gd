extends Node

#玩家生命值增减

func _init(amount:float,player_index:int) -> void:
	float_incrase(amount,player_index)
	pass

func float_incrase(amount:float,player_index:int) -> void:
	#配置文件修改
	var max_hp = GameData.players[player_index]["max_hp"]
	var current_hp = GameData.players[player_index]["current_hp"]
	GameData.players[player_index]["current_hp"] = min(max_hp*amount+current_hp,max_hp)
	
	pass
	
