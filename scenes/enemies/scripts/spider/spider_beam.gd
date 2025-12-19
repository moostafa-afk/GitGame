extends ShapeCast2D
#class_name Hitbox_shape

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

func _physics_process(_delta: float) -> void:
    
    if self.is_colliding():
        point = self.get_collision_point(0)

        var closest_collider: Node2D = null
## Inf is infinity, used here to guarantee smallest distance for the first collider
        var smallest_distance := INF

        for i in range(get_collision_count()):
           var collider = get_collider(i)
           var distance_x = collider.global_position.x - self.global_position.x

           if distance_x  < smallest_distance :
            ## Sets smallest distance
               smallest_distance = distance_x 
             ## Sets closest collider
               closest_collider = collider
    
## Damage here     
        if closest_collider == parent:
            return
        closest_collider.get_node("Hurtbox").take_damage(damage, get_knockback(), self)
  
func get_knockback() -> Vector2:
    var knockback: Vector2
    if knockback_enabled:
        knockback = Vector2.RIGHT.rotated(global_rotation) * knockback_strength
    return knockback
    
