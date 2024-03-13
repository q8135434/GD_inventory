class_name Weapon extends Items

#攻击力
var _ap:int

var weapon_ap:int:
	get:
		return _ap
	set(v):
		_ap = v
		

func attack():
	pass
	
func info_to_string() -> String:
	return ""
