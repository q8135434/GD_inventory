extends Node

#玩家生命值增减

func _init(amount:int,player_index:int) -> void:
	int_increase(amount,player_index)
	pass
	

func int_increase(amount:int,player_index:int) -> void:
	#配置文件修改
	var max_hp = GameData.players[player_index]["max_hp"]
	var current_hp = GameData.players[player_index]["current_hp"]
	GameData.players[player_index]["current_hp"] = min(current_hp+amount,max_hp)
	
	pass
	
