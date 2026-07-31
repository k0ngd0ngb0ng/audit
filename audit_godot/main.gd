extends Node

@onready var debug_label = %Debug

var wait_t : int = 10;
var time_dict = Time.get_time_dict_from_system()
func _ready():
	%Timer.set_wait_time(wait_t)
	%Timer.start()
	$Sound.volume_db = 8
	
 

func _on_timer_timeout() -> void:
	#%Sound.play()
	pass

#	Stopp Button
func _on_stopp_button_up() -> void:
	debug_label.text = str(sec/60)
	%Sound.stop()

	
#	print(time_dict.hour, ":", time_dict.minute, ":", time_dict.second)
#	print(time_dict.minute)
	print(time_dict.second)
var ad_t : int 
var sec : int
func _process(delta: float) -> void:
	time_dict = Time.get_time_dict_from_system()
	%show_time.text = str(time_dict.hour, ":", time_dict.minute, ":", time_dict.second)
	if time_dict.second == 0:
		%Sound.play()
	#	Show Time in seconds
	#ad_t += 1
	#if (ad_t % 165) == 0:
		#sec += 1
		#%show_time.text = str(sec)
	


func _on_button_button_up() -> void:
	pass # Replace with function body.
