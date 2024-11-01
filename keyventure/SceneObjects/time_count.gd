extends Node
@onready var timer: Timer = %Timer
@onready var timer_label: Label = %TimerLabel

func _ready() -> void:
 timer.start(15)
 
func time_left_to_live():
 var time_left = timer.time_left
 var second = int(time_left) %60
 return second

func _process(delta: float) -> void:
 timer_label.text = str("Time: ", time_left_to_live())
