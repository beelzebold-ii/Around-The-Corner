-- data types!

-- Vector2
Vector2Meta = {
	__add = function(a,b)
		if getmetatable(a)~=Vector2Meta then
			a = Vector2(a,a)
			end
		if getmetatable(b)~=Vector2Meta then
			b = Vector2(b,b)
			end
		return Vector2(a.x + b.x, a.y + b.y)
		end,
	__sub = function(a,b)
		if getmetatable(a)~=Vector2Meta then
			a = Vector2(a,a)
			end
		if getmetatable(b)~=Vector2Meta then
			b = Vector2(b,b)
			end
		return Vector2(a.x - b.x, a.y - b.y)
		end,
	__mul = function(a,b)
		if getmetatable(a)~=Vector2Meta then
			a = Vector2(a,a)
			end
		if getmetatable(b)~=Vector2Meta then
			b = Vector2(b,b)
			end
		return Vector2(a.x * b.x, a.y * b.y)
		end,
	__div = function(a,b)
		if getmetatable(a)~=Vector2Meta then
			a = Vector2(a,a)
			end
		if getmetatable(b)~=Vector2Meta then
			b = Vector2(b,b)
			end
		return Vector2(a.x / b.x, a.y / b.y)
		end,
	__unm = function(a)
		return Vector2(-a.x, -a.y)
		end,
	__len = function(a)
		return math.sqrt(a^2 + b^2)
		end,
}

function Vector2(vx,vy)
	if vx==nil then
		return {x = 0, y = 0}
		end
	if vy==nil then
		vy = vx
		end
	local vt = {x = vx, y = vy}
	setmetatable(vt,Vector2Meta)
	assert(getmetatable(vt)==Vector2Meta,"Vector2's metatable is incorrect!")
	return vt
	end