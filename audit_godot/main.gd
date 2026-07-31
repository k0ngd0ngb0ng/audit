extends Node

@onready var debug_label = %Debug

var wait_t : int 
var time_dict = Time.get_time_dict_from_system()
func _ready():
	#%Timer.set_wait_time(wait_t)
	#%Timer.start()
	$Sound.volume_db = 8
	
 

func _on_timer_timeout() -> void:
	
	%Sound.play()
	
	%debug_label.text = "went off at"
	time_dict = Time.get_time_dict_from_system()
	%show_time.text = str(time_dict.hour, ":", time_dict.minute, ":", time_dict.second)
	# readjust the timer once it goes of at hour:00:00
	wait_t = 60*60
	%Timer.set_wait_time(wait_t)
	pass

#	Stopp Button
func _on_stopp_button_up() -> void:
	
	%Sound.stop()


var wait_sec : int
var wait_minute : int
var timer_set : bool = false
func _process(delta: float) -> void:
	if timer_set == false : 
		time_dict = Time.get_time_dict_from_system()
		%show_time.text = str(time_dict.hour, ":", time_dict.minute, ":", time_dict.second)
		wait_sec = 60 - time_dict.second
		wait_minute = 60 - time_dict.minute
		if wait_sec == 60:
			wait_sec = 0
		if wait_minute == 60 :
			wait_minute = 0
		wait_t = wait_sec * 60 + wait_minute
		%Timer.set_wait_time(wait_t)
		%Timer.start() 
		print(wait_minute, ":", wait_sec )
		timer_set = true
		set_process(false)
	print("Process is SET")

func _on_button_button_up() -> void:
	pass # Replace with function body.
