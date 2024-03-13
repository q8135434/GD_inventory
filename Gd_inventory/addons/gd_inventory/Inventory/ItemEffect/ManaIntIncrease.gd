extends Node

#玩家魔法值增减

func _init(amount:int,player_index:int) -> void:
	int_increase(amount,player_index)
	pass
	

func int_increase(amount:int,player_index:int) -> void:
	#配置文件修改
	var max_mp = GameData.players[player_index]["max_mp"]
	var current_mp = GameData.players[player_index]["current_mp"]
	GameData.players[player_index]["current_mp"] = min(current_mp+amount,max_mp)
	
	pass
	
