extends CharacterBody3D

@export var speed: float = 2.0
@export var detection_range: float = 10.0
@export var target: NodePath = ""

var player: Node3D = null

func _ready():
	# Koble til spiller-noden
	if target != null:
		player = get_node(target)

func _physics_process(delta):
	# Sjekk om spilleren er i rekkevidde og beveg mot den
	if player and is_player_in_range():
		move_towards_player(delta)

func is_player_in_range() -> bool:
	return global_transform.origin.distance_to(player.global_transform.origin) <= detection_range

func move_towards_player(delta):
	# Finn retning og beveg fienden
	var direction = (player.global_transform.origin - global_transform.origin).normalized()
	velocity = direction * speed
	move_and_slide()
