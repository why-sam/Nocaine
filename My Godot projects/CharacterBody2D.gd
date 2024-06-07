extends CharacterBody2D

const SPEED = 100000.0
const JUMP_VELOCITY = -1200.0
var direction_vector: Vector2 = Vector2.ZERO

const LEFT = false
const RIGHT = true

var direction: bool = true

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

# Variable to keep track of the number of collectibles collected
var collectible_count: int = 0

func _physics_process(delta):
	direction_vector = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()

	velocity = direction_vector * SPEED * delta

	move_and_slide()

	if velocity.x > 0:
		direction = RIGHT
	elif velocity.x < 0:
		direction = LEFT

	animated_sprite_2d.flip_h = direction

# This function will be called when the Player collides with an area
func _on_Area2D_body_entered(body):
	if body.name == "Area2D":
		# Increase the collectible count
		collectible_count += 1
		# Check if the count is 3
		if collectible_count == 3:
			# Play the overdosed animation
			animation_player.play("overdosed")
			# Optionally, reset the count if you want to be able to collect 3 more and play again
			collectible_count = 0
		# Optionally, remove the collectible from the scene
		body.queue_free()






