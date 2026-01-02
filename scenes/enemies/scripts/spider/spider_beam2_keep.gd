extends ShapeCast2D
class_name Hitbox_shape
var collider
var furthest_collider
var point := Vector2.ZERO
## Damage value to apply.
@export var damage: float = 1.0
## Push back the victim.
@export var knockback_enabled: bool = false
## Desired pushback speed.
@export var knockback_strength: float = 500.0
## This is used to access the parent (spider) since owner
## donest work if it belongs to another scene
@onready var parent = get_parent().get_parent().get_parent() 
var closest_collider: Node2D

func _physics_process(_delta: float) -> void:

    
## Inf is infinity, used here to guarantee furthest distance for the first collider
        var furthest_distance := -INF

        for i in range(get_collision_count()):
           collider = get_collider(i)
           var distance_x = collider.global_position.x - self.global_position.x

           if distance_x  > furthest_distance:
             ## Sets smallest distance
               furthest_distance = distance_x 
             ## Sets closest collider
               point = self.get_collision_point(i)

               furthest_collider = collider
               %beam_particles.global_position.x= point.x +owner.get("particle_offset")

    
## Damage here     
## Damage is only done to the closest collider
        if furthest_collider == parent:
            return
        furthest_collider.get_node("Hurtbox").take_damage(damage, get_knockback(), self)
  
func get_knockback() -> Vector2:
    var knockback: Vector2
    if knockback_enabled:
        knockback = Vector2.RIGHT.rotated(global_rotation) * knockback_strength
    return knockback
    
