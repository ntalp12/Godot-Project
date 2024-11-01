extends Node

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://ScenePages/level_selected.tscn")

func _on_exit_button_2_pressed() -> void:
	get_tree().quit()
