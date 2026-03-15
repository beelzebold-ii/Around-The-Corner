-- asset definitions here

-- tiles
tile = {
	wall_n 			= love.graphics.newImage("graphics/tilesets/wall_n.png"),
	wall_w 			= love.graphics.newImage("graphics/tilesets/wall_w.png"),
	wall_nw 		= love.graphics.newImage("graphics/tilesets/wall_nw.png"),
	
	wire_tile 		= love.graphics.newImage("graphics/tilesets/wire_tile.png"),
	wire_wall_s 	= love.graphics.newImage("graphics/tilesets/wire_wall_s.png"),
	wire_wall_e 	= love.graphics.newImage("graphics/tilesets/wire_wall_e.png"),
	wire_wall_se 	= love.graphics.newImage("graphics/tilesets/wire_wall_se.png"),
	
	ruin_tile 		= love.graphics.newImage("graphics/tilesets/ruin_tile.png"),
	
	white_tile 		= love.graphics.newImage("graphics/tilesets/white_tile.png"),
	white_wall_s 	= love.graphics.newImage("graphics/tilesets/white_wall_s.png"),
	white_wall_e 	= love.graphics.newImage("graphics/tilesets/white_wall_e.png"),
	white_wall_se 	= love.graphics.newImage("graphics/tilesets/white_wall_se.png"),
}

-- tilesets
tileset = {
	wire = {
		tile 	= tile.wire_tile,
		s 		= tile.wire_wall_s,
		e 		= tile.wire_wall_e,
		se 		= tile.wire_wall_se,
		n		= tile.wall_n,
		w		= tile.wall_w,
		nw		= tile.wall_nw
	},
	white = {
		tile 	= tile.white_tile,
		s 		= tile.white_wall_s,
		e 		= tile.white_wall_e,
		se 		= tile.white_wall_se,
		n		= tile.wall_n,
		w		= tile.wall_w,
		nw		= tile.wall_nw
	},
	ruin = {
		tile 	= tile.ruin_tile,
		s 		= tile.wire_wall_s,
		e 		= tile.wire_wall_e,
		se 		= tile.wire_wall_se,
		n		= tile.wall_n,
		w		= tile.wall_w,
		nw		= tile.wall_nw
	},
}

-- other graphics
graphic = {
	sel_floor 	= love.graphics.newImage("graphics/sel_tile.png"),
	sel_full 	= love.graphics.newImage("graphics/sel_full.png"),
}