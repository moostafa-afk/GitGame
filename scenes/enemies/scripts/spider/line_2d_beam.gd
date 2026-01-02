extends Line2D
func _physics_process(_delta):
    if %ShapeCast2D.is_colliding():
## points[1] , is the second point in the two point line array

        #points[1].x = local_coll.x  + .01
        var collider_position = %ShapeCast2D.get("point")
        
## global_position only applies to nodes,but points uses vector2      
## We turn this to local position so that it will work dut to the collider being from another scene.
        points[1].x = to_local(collider_position).x
    else:
        points[1].x = 8.75
        
        
        
    
    
