extends Area2D

signal collected

@onready var collision_shape_2d = $CollisionShape2D

func _ready():
	# Adjust the collision shape to match the sprite's size (if a sprite is used)
	if has_node("Sprite2D"):
		var sprite = $Sprite2D
		if sprite.texture:
			collision_shape_2d.shape.extents = sprite.texture.get_size() / 2

func _on_Area2D_body_entered(body):
	if body is CharacterBody2D:
		print ("working")
		emit_signal("collected")
		queue_free()
		

		
