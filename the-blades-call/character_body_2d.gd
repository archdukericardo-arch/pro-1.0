extends CharacterBody2D


const SPEED = 200

func _physics_process(delta):
	var direction = Input.get_vector("left","right","up", "down")
	
	velocity = direction * SPEED
	
	move_and_slide()

	play_animation(direction)

func _process_animation() -> void:
	if velocity != Vector2.ZERO:
		play_animation

func play_animation(dir: Vector2) -> void:
	if dir.x != 0:
		animation_sprite_2d.flip_h = dir.x < 0
		animation_sprite_2d.play("right")

	elif dir.y < 0:
		animation_sprite_2d.play("up")
	elif dir.y >0:
		animation_sprite_2d.play("down")


		
