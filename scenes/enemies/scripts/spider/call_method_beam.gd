extends Node2D

@export var particle_offset := 0
@onready var source := get_parent().get_parent().get_parent() 

func _physics_process(_delta):
    
    if %ShapeCast2D.is_colliding():
        var collider = %ShapeCast2D.get_collider(0)
        if collider == source:  
          %beam_particles.visible = false   
          %beam_particles.visible = true 
        
        
    else:
        %beam_particles.visible = false     

        
func play_animations():
    %scale_x_axis_pivot.play("laser_beam")
    %scale_y_axis.play("new_animation")
