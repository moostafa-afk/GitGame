extends Sprite2D
@onready var player = get_tree().get_first_node_in_group("player")

func _physics_process(delta: float) -> void:
    if %ShapeCast2D.is_colliding():
        %scale_x_axis_pivot.stop() 
        var collider = %ShapeCast2D.get_collider(0)
        var x_distance = abs(player.global_position.x - owner.global_position.x)
        #%Sprite2D.scale.x = (1 / scale.x )  * x_distance   
        var desired = abs(player.global_position.x - global_position.x)
        var base_length = %Sprite2D.texture.get_size().x * %Sprite2D.scale.x

##.target position uses local position, and the collider (player), is from another scene therefore
##.position wont work, so instead we use (to_local) to make it local to the parent of THIS scene
        #%ShapeCast2D.target_position.x = $ShapeCast2D.to_local(collider.position).x
    else:
        %ShapeCast2D.target_position = Vector2.ZERO
        %scale_x_axis_pivot.play("laser_beam")
        
        
