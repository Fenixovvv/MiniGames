extends Node2D

@export var road: PackedScene
@export var car: PackedScene

@onready var first_frame = true

var car_instance: CharacterBody2D
var road_instance: Sprite2D
var road_array = [
		road.instantiate(), road.instantiate(), road.instantiate(), road.instantiate(), 
		road.instantiate(), road.instantiate(), road.instantiate(), road.instantiate()
		]

func _ready():
	print("READY")
	car_instance = car.instantiate()
	add_child(car_instance)
	car_instance.position = Vector2(360, 720)
	
	# Road instances with even number are on left side; with odd numbers - on right

	for road_num in 8:
		road_array[road_num].position.x = 180 + 360 * ((road_num + 1) % 2)
		# Finish road spawn positions and check if works
		road_array[road_num].position.y = 0
		
func _process(delta):
	pass
	

func road_managment():
	pass
