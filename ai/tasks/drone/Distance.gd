extends BTAction
@export var min_distance = 10
@export var return_1 = Status.SUCCESS
@export var else_return_2 = Status.FAILURE

func _tick(_delta: float) -> Status:
    var player = agent.get_tree().get_nodes_in_group("player")[0]
    var distance = agent.global_position.distance_to(player.global_position)
    if distance < min_distance:
        return return_1
    else:
      return else_return_2    
    
    
    
    
    
