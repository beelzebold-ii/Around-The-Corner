-- controls! very important.

camera = Vector2(-160,-80)

function UpdateControls()
	if love.keyboard.isDown("up") then
		camera.y = camera.y - 2
		end
	if love.keyboard.isDown("down") then
		camera.y = camera.y + 2
		end
	if love.keyboard.isDown("left") then
		camera.x = camera.x - 2
		end
	if love.keyboard.isDown("right") then
		camera.x = camera.x + 2
		end
	end