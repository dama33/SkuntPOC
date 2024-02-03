extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var ray_origin = Vector3()
var ray_target = Vector3()
@export var level_camera: Camera3D

@onready var camera:= $Camera

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	velocity = Vector3.ZERO
	velocity.x += Input.get_axis("left", "right")
	velocity.z += Input.get_axis("forward", "backward")
	velocity = velocity.normalized()*500.0*delta
	level_camera.position = position
	level_camera.position.y += 25 
	level_camera.position.z += 10
	move_and_slide()
	
	var mouse_position = get_viewport().get_mouse_position()
	ray_origin = level_camera.project_ray_origin(mouse_position)
	ray_target = ray_origin + level_camera.project_ray_normal(mouse_position)*1000
	
	var space_state = get_world_3d().direct_space_state
	var intersection = space_state.intersect_ray(PhysicsRayQueryParameters3D.create(ray_origin, ray_target))
	if(intersection.get("position") != null):
		var pos = intersection.get("position")
		var view_angle = Vector3(pos.x, position.y, pos.z)
		look_at(view_angle)
		camera.look_at_from_position(Vector3(position.x, position.y+25, position.z+10), position, Vector3.UP)
		
		
