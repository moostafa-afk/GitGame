extends ShapeCast2D
class_name Hitbox_shape

var point := Vector2.ZERO
## Damage value to apply.
@export var damage: float = 1.0
## Push back the victim.
@export var knockback_enabled: bool = false
## Desired pushback speed.
@export var knockback_strength: float = 500.0
@onready var drone = get_tree().get_nodes_in_group("drone")

func _ready() -> void:
    %timer.start()

func _physics_process(_delta: float) -> void:
    if self.is_colliding():
        point = self.get_collision_point(0)
        var collider = self.get_collider(0)

        if collider.get_node_or_null("Hurtbox"):
            var enemies = get_tree().get_nodes_in_group("enemies")
            for enemy in enemies:
              enemy.connect("owner_signal", on_projectile_owner)
            
        elif collider:
            return
            
            
func get_knockback() -> Vector2:
    var knockback: Vector2
    if knockback_enabled:
        knockback = Vector2.RIGHT.rotated(global_rotation) * knockback_strength
    return knockback
    
func on_projectile_owner(owner_signal):
        var collider = self.get_collider(0)
        if collider != owner_signal:
            collider.get_node("Hurtbox").take_damage(damage, get_knockback(), self)
        else:
            print("It was the owner") 
        
        
        
        
        
        
           
