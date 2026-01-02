extends ShapeCast2D
#class_name Hitbox_shape

var point := Vector2.ZERO
#@onready var player = get_tree().get_first_node_in_group("player")
## Damage value to apply.
@export var damage: float = 1.0
## Push back the victim.
@export var knockback_enabled: bool = false
## Desired pushback speed.
@export var knockback_strength: float = 500.0

func _physics_process(_delta: float) -> void:

    #var hurtbox = player.get_node("Hurtbox")
    if self.is_colliding():
        point = self.get_collision_point(0)
        var collider = self.get_collider(0)
        
## Prevents damaging itself
        for i in owner.source:
            if collider == i:
                return
            
        if collider.get_node_or_null("Hurtbox"):
            collider.get_node("Hurtbox").take_damage(damage, get_knockback(), self)
        
        
func get_knockback() -> Vector2:
    var knockback: Vector2
    if knockback_enabled:
        knockback = Vector2.RIGHT.rotated(global_rotation) * knockback_strength
    return knockback
    
