extends Line2D

func _physics_process(delta):
    if %ShapeCast2D.is_colliding():
        var coll_point = %ShapeCast2D.get_collision_point(0)
        
## We turn this to local position so that it will work 
        var local_coll = to_local(coll_point)
        
## points[1] , is the second point in the two point line array
        points[1].x = local_coll.x
