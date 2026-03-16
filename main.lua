-- hello world!

-- real shit here
-- is this how including from subdirs works in lua? dunno but I wanna make an *organized* mess
require("lua.assets")
require("lua.datatypes")
require("lua.level")
require("lua.load")
require("lua.controls")

-- even realer shit here
-- just core loops which will refer to external functions for the sake of cleanliness
function love.load(args)
	love.graphics.setDefaultFilter("nearest")
	
	level.InitLevel(Vector2(25,25),tileset.white)
	level.SetTile(Vector2(5,1),false)
	level.SetTile(Vector2(5,2),false)
	level.SetTile(Vector2(5,3),false)
	level.SetTile(Vector2(5,4),false)
	level.SetTile(Vector2(6,1),false)
	level.SetTile(Vector2(6,2),false)
	level.SetTile(Vector2(6,3),false)
	level.SetTile(Vector2(6,4),false)
	level.SetTile(Vector2(7,1),false)
	level.SetTile(Vector2(7,2),false)
	level.SetTile(Vector2(7,3),false)
	level.SetTile(Vector2(7,4),false)
	level.SetTile(Vector2(8,1),false)
	level.SetTile(Vector2(8,2),false)
	level.SetTile(Vector2(8,3),false)
	level.SetTile(Vector2(8,4),false)
	end

function love.update(dt)
	UpdateControls()
	end

function love.draw()
	love.graphics.print("hello world! " .. love.timer.getFPS(),400,300)
	level.DrawLevel(camera)
	end
