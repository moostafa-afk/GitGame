extends Node
@export var some: String 
func _on_level_child_entered_tree(node: Node) -> void:
# TODO: Will have to find a way to make the group (laser_sprite) an export
    if node.is_in_group(str(some)):
            ## gets the latest (newest) laser
            var laser: = get_tree().get_nodes_in_group("laser_sprite")[-1]
            laser.connect("point_of_collision",collision)
            
func collision(shape_rotation:float,point:Vector2):
    var laser_particle: PackedScene = preload("res://scenes/instantiated/laser_particles.tscn")
    var inst = laser_particle.instantiate()
    ## Here I set the position and rotation of each particle to be the same as the same as the laser
    inst.global_position = point
    inst.rotation = shape_rotation
    add_child(inst)    #print("particle added for", point.name)
    
