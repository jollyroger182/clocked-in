extends Control

@export var tier: Dictionary
@export var offset: float

@export var container: VBoxContainer
@export var tier_label: Label
@export var offset_label: Label

signal finished


func _ready() -> void:
	tier_label.text = tier["name"]
	tier_label.add_theme_color_override("font_color", Color(tier["color"]))
	offset_label.text = ("+" if offset >= 0 else "") + str(roundi(offset * 1000))
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN)
	tween.tween_property(self, "position", position - Vector2(0, 100), 0.4)
	tween.parallel().tween_property(self, "modulate:a", 0, 0.4)
	tween.tween_callback(finished.emit)
	tween.tween_callback(queue_free)
