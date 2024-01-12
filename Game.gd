extends Node2D

@export var road: PackedScene
@export var car: PackedScene

@onready var first_frame = true

var car_instance: CharacterBody2D
var road_instance: Sprite2D
var road_array: Array
const SPEED = 10

func _ready():
	print("READY")
	car_instance = car.instantiate()
	
	car_instance.position = Vector2(360, 720)
	road_array = [
		road.instantiate(), road.instantiate(), road.instantiate(), road.instantiate(), 
		road.instantiate(), road.instantiate(), road.instantiate(), road.instantiate()
	]
	# Road instances with even number are on left side; with odd numbers - on right
	
	for road_num in 8:
		add_child(road_array[road_num])
		road_array[road_num].position.x = 180 + 360 * ((road_num + 1) % 2)
		# Finish road spawn positions and check if works
		road_array[road_num].position.y = -180 + int(road_num / 2) * 360
	
	add_child(car_instance)
	
func _process(delta):
	road_managment()
	
func road_managment():
	for road_instance in road_array:
		road_instance.position.y += SPEED
		print(road_instance.position.y)
		if road_instance.position.y > 1440:
			road_instance.position.y = -180
