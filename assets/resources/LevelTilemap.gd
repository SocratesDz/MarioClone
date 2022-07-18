extends TileMap

onready var ItemBlock = preload("res://scenes/ItemBlock.tscn")

func _ready():
	var item_block_cells = get_used_cells_by_id(10)
	_add_item_blocks(item_block_cells)

func _add_item_blocks(used_cells):
	for i in used_cells.size():
		var pos = map_to_world(used_cells[i])
		var offset = cell_size / 2
		var block = ItemBlock.instance()
		block.position = pos + offset
		add_child(block)
		set_cellv(pos, -1)
