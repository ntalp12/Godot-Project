extends Area2D
@onready var game_manager: Node = %GameManager

func _ready() -> void:
	pass 
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "p1pink" || "p2green"):
		game_manager.hit_damage()
