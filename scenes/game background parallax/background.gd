extends ParallaxBackground


@export var base_scroll : float = 0
@export var additional_scroll : float = 0
@export var bg_random_seed : bool = false

@onready var bg_texture_5: TextureRect = $BGLayer5/BGTexture5

var norm_y: float

func _ready() -> void:
	if bg_random_seed:
		bg_texture_5.set_seed(randi())

func _process(delta: float) -> void:
	scroll_base_offset += Vector2(0, base_scroll + additional_scroll * norm_y) * delta

func _on_character_body_2d_player_data_signal(velocity: Vector2, position: Vector2) -> void:
	var norm_vel_y = velocity.y / -500
	var norm_pos_y = 1 - (position.y / 648)
	norm_y = maxf(0, norm_vel_y) + norm_pos_y
