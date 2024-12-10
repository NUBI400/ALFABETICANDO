extends Node2D
@onready var pontos_2: Label = $Control/Pontos2

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var caderno: Node2D = $CADERNO

@onready var fade: AnimationPlayer = $AnimationPlayer

@onready var impedir_click: ColorRect = $"IMPEDIR CLICK"


@onready var timer_label: Label = $timer_label
@onready var timer_background: Sprite2D = $timer_label/timer_background
@onready var timer: Timer = $timer_label/Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_timer_label()
	animated_sprite_2d.play("abrindo")
	impedir_click.MOUSE_FILTER_STOP
	caderno.modulate = Color(1, 1, 1, 0)


func _physics_process(delta: float) -> void:
	pontos_2.text = str(Global.pontos)
	update_timer_label()


func _on_touch_screen_button_released() -> void:
	if Global.creditos == true:
		Global.creditos = false
		
		Global.timer_acabou = true
		fade.play("fade_on")
	else:
		Global.inicio = true
		Global.animation = false
		

func _on_animated_sprite_2d_animation_finished() -> void:
	if Global.creditos == true or Global.inicio == false:
		animated_sprite_2d.play("abrindo")
	else:
		fade.play("fade_on")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_on":
		impedir_click.MOUSE_FILTER_IGNORE
		Global.timer = true
		update_timer_label()
		timer.start()


	
	if anim_name == "fade_off":
		impedir_click.MOUSE_FILTER_STOP
		if Global.creditos == false:
			Global.timer = false
			
			Global.animation = true
			animated_sprite_2d.play("abrindo")


# Atualiza o texto da Label com o tempo restante
func update_timer_label() -> void:
	var minutes = int(Global.time_left / 60)
	var seconds = int(Global.time_left % 60)
	timer_label.text = str("%02d:%02d" % [minutes, seconds])

# Função chamada a cada segundo pelo Timer
func _on_timer_timeout() -> void:
	if Global.timer:
		if Global.time_left > 0:
			Global.time_left -= 1
			update_timer_label()
			timer.start()
		else:
			timer.stop()
			if Global.creditos == false:
				Global.timer_acabou = true
