extends Node2D

var hor_vector = Vector2(0, 0)
var car_width = 0

const HOR_SPEED = 10
const SCREEN_WIDTH = 720 

func _ready():
	car_width = 49
	print("Car width", car_width)
	
func _process(delta):
	movement()

func movement():
	
	if Input.is_action_pressed("ui_left"):
		hor_vector = Vector2(-HOR_SPEED, 0)
	elif Input.is_action_pressed("ui_right"):
		hor_vector = Vector2(HOR_SPEED, 0)
	
	if position.x > SCREEN_WIDTH - int(car_width / 2) or position.x < int(car_width / 2):
		if position.x > SCREEN_WIDTH - int(car_width / 2):
			#print(1, position.x, " > ", SCREEN_WIDTH - int(car_width / 2))
			position.x = SCREEN_WIDTH - int(car_width / 2)
		else:
			#print(2)
			position.x = int(car_width / 2)
		hor_vector = Vector2(0, 0)
	else:
		hor_vector = Vector2(lerpf(hor_vector.x, 0, 0.1), 0)
		
	position += hor_vector
