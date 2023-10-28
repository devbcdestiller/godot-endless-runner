class_name Background

extends ParallaxBackground

@export var scroll_speed_x: float = 100.0


func _process(delta):
	self.scroll_offset.x -= delta * scroll_speed_x


func set_scroll_speed_x(scroll_speed: float):
	scroll_speed_x = scroll_speed
