extends Area2D

export var id := 0
var portal_is_locked := false

func lock_portal():
	portal_is_locked = true
	yield(get_tree().create_timer(0.5), "timeout")
	portal_is_locked = false
