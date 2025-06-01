extends Node
@export var game_controller : Node
const MAX_WIDTH= 960*20
const ROAD_SPEED= 500
var music_time
var music_length
func _ready():
	music_length=game_controller.get_music_length()
	music_time=0
	
	#setup image positions
	var count=0
	for image in $ParallaxBackground/InnerBackground.get_children():
		image.offset=Vector2(960*(3+count),270)
		count+=1
	
func _process(delta: float) -> void:
	music_time=game_controller.get_music_time()
	$ParallaxBackground/InnerBackground.motion_offset.x=-lerp(0,MAX_WIDTH,music_time/music_length)
	$ParallaxBackground/RoadLayer.motion_offset.x-=ROAD_SPEED*delta
