extends TileMap

var offset = Vector2(0,0)

func _on_Timer_timeout():
#	print(offset)
	if(offset.x < 80):
		offset.x = 80
	else:
		offset.x = 0
	var tileset = get_tileset()
	var rect = tileset.tile_get_region(0)
	rect.position = offset
	tileset.tile_set_region(0,rect)
