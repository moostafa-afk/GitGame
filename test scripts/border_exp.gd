@tool
extends Node2D
class_name Axis

@export_range(1, 20)
var width: int = 10:
    set = set_width

func set_width(v: int) -> void:
    width = v
    queue_redraw()

func _draw() -> void:
    if not Engine.is_editor_hint():
        return

    draw_line(Vector2(-100000, 0), Vector2(100000, 0), Color.RED, width)
    draw_line(Vector2(0, -100000), Vector2(0, 100000), Color.GREEN, width)
