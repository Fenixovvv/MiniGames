extends Node2D

@export var car: PackedScene
@onready var start = true
var car_instance: Sprite2D
var hor_vector: Vector2

func _ready():
	print("READY")
	
func _process(delta):
	if start:
		car_instance = car.instantiate()
		add_child(car_instance)
		car_instance.position = Vector2(360, 720)
		start = false
	
	if Input.is_action_pressed("ui_left") and car_instance.position.x > 55:
		hor_vector = Vector2(-10, 0)
	elif Input.is_action_pressed("ui_right") and car_instance.position.x < 665:
		hor_vector = Vector2(10, 0)
	
	car_instance.position += hor_vector
	hor_vector = Vector2(0, 0)
