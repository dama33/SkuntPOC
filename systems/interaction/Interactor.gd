extends Area3D

class_name Interactor

var controller: Node3D

func focus(interactable: Interactable):
	interactable.focused.emit(self)

func unfocus(interactable: Interactable):
	interactable.unfocused.emit(self)

func interact(interactable: Interactable):
	interactable.interacted.emit(self)
	
func get_closest_interactable() -> Interactable:
	var list: Array[Area3D] = get_overlapping_areas()
	var distance: float
	var closest_distance: float = INF
	var closest: Interactable = null
	
	for interactable in list:
		distance = interactable.position.distance_to(global_position)
		
		if distance < closest_distance:
			closest = interactable as Interactable
			closest_distance = distance
			
	return closest
