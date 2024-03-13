extends Node

#玩家魔法值增减

func _init(amount:float,player_index:int) -> void:
	float_incrase(amount,player_index)
	pass
	
	
func float_incrase(amount:float,player_index:int) -> void:
	#配置文件修改
	var max_mp = GameData.players[player_index]["max_mp"]
	var current_mp = GameData.players[player_index]["current_mp"]
	GameData.players[player_index]["current_mp"] = min(current_mp+(max_mp * amount),max_mp)
	
	pass
	
