extends Line2D
@export var offset:= 0
func _physics_process(_delta):
    if %ShapeCast2D.is_colliding():
## points[1] , is the second point in the two point line array

        var collider_position = %ShapeCast2D.get("point") + Vector2(offset,0)
        
## This prevents the laser from eternally colliding with the original spider parent
        if %ShapeCast2D.collider != get_parent().get_parent().get_parent(): # spider
          points[1].x = to_local(collider_position).x
        
        else:
          points[1].x = 8.75
            
## global_position only applies to nodes,but points uses vector2      
## We turn this to local position so that it will work dut to the collider being from another scene.
    
    else:
        points[1].x = 8.75
        
        
        
    
    
