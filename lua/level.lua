-- before testing can begin, I need an environment to put a bunch of Guys in!

-- note:
-- tilemap is a 2D table of any size. who knows! the possibilities are endless.
-- indexed just as: tilemap[x][y]
-- note:
-- tiles consist of a bool for if filled in and a tileset

-- table which will contain functions and interesting information
level = {
	tilemap = {},
	size = Vector2(32,32),
}

canv_floortile = love.graphics.newCanvas(800,600)
canv_walls = love.graphics.newCanvas(800,600)

-- initializes the level to a given size, filled with a given tileset
function level.InitLevel(size,fillset)
	if getmetatable(size) ~= Vector2Meta then
		error("InitLevel size must be a Vector2")
		return
		end
	
	level.size = size
	
	for x = -1,size.x+2,1 do
		level.tilemap[x] = {}
		for y = -1,size.y+2,1 do
			level.tilemap[x][y] = {filled = true,tileset = fillset}
			end
		end
	end

-- utility function that gets the screenpos of a given tile (regardless of camera offset)
-- separated for easy tweaking. takes a Vector2, will not tell you that.
function level.GetDrawPos(tile)
	local screenpos = Vector2(tile.x * 11,tile.x * 6) + Vector2(tile.y * -11,tile.y * 6)
	return screenpos
	end

-- draws the level from the pov of the given camera position
function level.DrawLevel(camera)
	if camera == nil then
		camera = Vector2(0,0)
		else
		if getmetatable(camera) ~= Vector2Meta then
			error("DrawLevel camera must be a Vector2")
			return
			end
		end
	
	love.graphics.setCanvas(canv_floortile)
	love.graphics.clear()
	love.graphics.setCanvas(canv_walls)
	love.graphics.clear()
	
	love.graphics.translate(-camera.x,-camera.y)
	
	for x = 0,level.size.x+1,1 do
		for y = 0,level.size.y+1,1 do
			local screenpos = level.GetDrawPos(Vector2(x,y))
			if level.tilemap[x][y].filled == false then
				-- draw floor tiles
				love.graphics.setCanvas(canv_floortile)
				love.graphics.draw(level.tilemap[x][y].tileset.tile,screenpos.x,screenpos.y)
				
				else
				-- draw wall tiles on separate layer to ensure correct layering
				love.graphics.setCanvas(canv_walls)
				-- walls need to know the states of their neighbors to draw correctly
				
				-- first draw NW as it needs to go below this tile's SE
				-- these are drawn at 70% opacity
				love.graphics.setColor(1.0,1.0,1.0,0.7)
				if level.tilemap[x-1][y].filled == false then
					if level.tilemap[x][y-1].filled == false then
						-- NW
						love.graphics.draw(level.tilemap[x][y].tileset.nw,screenpos.x,screenpos.y)
						else
						-- W
						love.graphics.draw(level.tilemap[x][y].tileset.w,screenpos.x,screenpos.y)
						end
					else
					if level.tilemap[x][y-1].filled == false then
						-- N
						love.graphics.draw(level.tilemap[x][y].tileset.n,screenpos.x,screenpos.y)
						end
					end
				
				-- then draw SE
				love.graphics.setColor(1.0,1.0,1.0,1.0)
				if level.tilemap[x+1][y].filled == false then
					if level.tilemap[x][y+1].filled == false then
						-- SE
						love.graphics.draw(level.tilemap[x][y].tileset.se,screenpos.x,screenpos.y)
						else
						-- E
						love.graphics.draw(level.tilemap[x][y].tileset.e,screenpos.x,screenpos.y)
						end
					else
					if level.tilemap[x][y+1].filled == false then
						-- S
						love.graphics.draw(level.tilemap[x][y].tileset.s,screenpos.x,screenpos.y)
						end
					end
				-- end per-tile draw loop
				end
			end
		end
	-- end tilemap iteration
	love.graphics.setCanvas()
	love.graphics.draw(canv_floortile,0,0,0,2)
	love.graphics.draw(canv_walls,0,0,0,2)
	end

-- fill and unfill tiles on the levelmap
function level.SetTile(tpos,fill,tset)
	if getmetatable(tpos) ~= Vector2Meta then
		error("SetTile tpos must be a Vector2")
		return
		end
	if tset == nil then tset = level.tilemap[tpos.x][tpos.y].tileset end
	level.tilemap[tpos.x][tpos.y] = {filled = fill,tileset = tset}
	end