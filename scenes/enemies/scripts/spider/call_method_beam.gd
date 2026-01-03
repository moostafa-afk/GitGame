extends Node2D

@export var particle_offset := 0
func _ready() -> void:
    %beam_particles.visible = false
    
func _physics_process(_delta):
    if %ShapeCast2D.is_colliding():
        if %ShapeCast2D.collider == get_parent(): # spider
          return

        else:
          %beam_particles.visible = true
    else:
        %beam_particles.visible = false
        
func play_animations():
    %scale_x_axis_pivot.play("laser_beam")
    %scale_y_axis.play("new_animation")
