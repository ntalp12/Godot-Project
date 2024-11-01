extends Node

@export var total_items: int = 10
var collected_items: int = 0
@onready var timer: Timer = %Timer
@onready var item_label: Label = %ItemLabel

func _ready() -> void:
	timer.start(15)
	timer.timeout.connect(Callable(self, "_on_timer_timeout"))
	update_item_label()

func _process(delta: float) -> void:
	pass

# Item
func item_collected() -> void:
	collected_items += 1
	update_item_label()
	if collected_items == total_items:
		win_game()

func _on_timer_timeout() -> void:
	if collected_items < total_items:
		lose_game()

func win_game() -> void:
	get_tree().change_scene_to_file("res://ScenePages/win_page.tscn")

func lose_game() -> void:
	get_tree().change_scene_to_file("res://ScenePages/lose_page.tscn")

func update_item_label() -> void:
	item_label.text = "Items Collected: " + str(collected_items) + "/" + str(total_items)
	
# Damage
func hit_damage():
	collected_items = 0
	update_item_label()
