function love.load()
    arrow_texture = love.graphics.newImage("arrow.png")
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
end

function love.update()
    mouseX, mouseY = love.mouse.getPosition()
    angle = math.atan2(mouseY - height/2, mouseX - width/2)
end

function love.draw()
    love.graphics.clear()
    love.graphics.translate(width/2, height/2)
    love.graphics.rotate(angle)
    love.graphics.draw(arrow_texture, -arrow_texture:getWidth()/2, -arrow_texture:getHeight()/2)
end

--[[
--By subtracting width/2 from the mouse x-coordinate and height/2 from the mouse y-coordinate, 
--you effectively center the coordinate system at the middle of the window.
--This adjustment ensures that when you use math.atan2 to find the angle, 
--it represents the angle between the center of the window and the mouse position relative to that center.
--]]
