extends Sprite2D

func _physics_process(delta: float) -> void:
    if %ShapeCast2D.is_colliding():
        %scale_x_axis_pivot.stop()
        %Sprite2D.scale.x = 10
#
    #else:
        #%scale_x_axis_pivot.play("laser_beam")
