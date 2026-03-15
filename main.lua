-- hello world!

-- real shit here
-- is this how including from subdirs works in lua? dunno but I wanna make an *organized* mess
require("lua.assets")
require("lua.datatypes")
require("lua.level")

-- even realer shit here
-- just core loops which will refer to external functions for the sake of cleanliness
function love.load(args)
	level.InitLevel(Vector2(25,25),tileset.white)
	level.SetTile(Vector2(3,1),false)
	level.SetTile(Vector2(3,2),false)
	level.SetTile(Vector2(4,1),false)
	level.SetTile(Vector2(4,2),false)
	end

function love.update(dt)
	
	end

function love.draw()
	love.graphics.print("hello world! " .. love.timer.getFPS(),400,300)
	level.DrawLevel(Vector2(0,0))
	end
