extends Label
func _physics_process(delta: float) -> void:
    self.text = str(%Health.current_health)
