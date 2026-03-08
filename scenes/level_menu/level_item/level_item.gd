extends PanelContainer

@export var title: String
@export var musician: String
@export var charter: String
@export var cover_artist: String

@export var title_label: Label
@export var musician_label: Label
@export var charter_label: Label

signal play


func _ready() -> void:
	title_label.text = title
	musician_label.text = musician
	charter_label.text = charter


func _on_play_pressed() -> void:
	play.emit()
