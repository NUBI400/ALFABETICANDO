extends Control
class_name Letras

@onready var texture_button: Button = $TextureButton

@export var letra: String = "A"  

signal letra_selecionada(letra: String)

func _ready() -> void:
	texture_button.text = letra
	texture_button.button_up.connect(_on_texture_button_button_up)

func _on_texture_button_button_up() -> void:
	
	emit_signal("letra_selecionada", letra)

func deselect():
	modulate = Color(1, 1, 1)
