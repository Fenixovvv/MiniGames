extends Node2D

@export var car: PackedScene
@onready var start = true
@onready var car_instance = car.instantiate() 

func _ready():
	print("READY")
	
func _process(delta):
	if start:
		owner.add_child(car_instance)
		car_instance.position = Vector2(360, 720)
		start = false
	
	if Input.is_action_just_pressed("ui_left"):
		car_instance.position += Vector2(-10, 0)
	
