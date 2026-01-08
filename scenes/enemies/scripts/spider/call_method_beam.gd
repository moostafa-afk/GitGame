extends Node2D

@export var particle_offset := 0

    
func _physics_process(_delta):
    if %ShapeCast2D.is_colliding() and %scale_x_axis_pivot.is_playing():
        if %ShapeCast2D.collider == get_parent(): # spider
          %beam_particles.visible = false
        
        else:
          %beam_particles.visible = true
        
    else:
        %beam_particles.visible = false
    
func play_animations():
    %scale_x_axis_pivot.play("laser_beam")
    %scale_y_axis.get_animation("new_animation").loop = true
    %scale_y_axis.play("new_animation")
    

func _on_scale_x_axis_pivot_animation_finished(anim_name: StringName) -> void:
    if anim_name == "laser_beam":
     %scale_y_axis.stop()
        
