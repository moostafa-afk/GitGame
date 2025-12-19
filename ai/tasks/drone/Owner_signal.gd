extends BTAction
signal owner_signal(owner_signal: CharacterBody2D)
func _enter() -> void:
    owner_signal.emit(agent)
    print("emit")
    pass
func _tick(_delta: float) -> Status:
    
    return SUCCESS
