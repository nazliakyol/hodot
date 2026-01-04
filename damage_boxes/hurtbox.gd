class_name HurtBox extends Area2D

signal hurt(hitbox : HitBox)

func _ready() -> void:
	area_entered.connect(on_area_entered)

func on_area_entered(area_2d : Area2D) -> void:
	if area_2d is not HitBox: return
	var hitbox = area_2d as HitBox
	if self in hitbox.hit_targets: return
	if hitbox.stores_hit_targets : hitbox.hit_targets.append(self) 
	hurt.emit(hitbox)
