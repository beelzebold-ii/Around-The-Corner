-- level loading from json files

json = require("lua.json")

function level.LoadLevel(file)
	local levelstring = ""
	if type(file) == "string" then
		levelstring = love.filesystem.read(file)
		else
		file:open('r')
		levelstring = file:read()
		file:close()
		end
	
	local levelfile = json.decode(levelstring)
	
	level.InitLevel(Vector2(levelfile.size.x,levelfile.size.y),tileset.white)
	
	local savetilemap = levelfile.tilemap
	for i,v in ipairs(savetilemap) do
		for i2,v2 in ipairs(v) do
			level.tilemap[i][i2] = {filled = v2.f,tileset = tileset[v2.t]}
			end
		end
	end

function love.filedropped(file)
	-- should work? as filesystem.read can take a filename or filedata, I think.
	level.LoadLevel(file)
	end