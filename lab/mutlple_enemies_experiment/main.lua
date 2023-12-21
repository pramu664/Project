particle = require("particle")
push = require("push")
class = require("class")

require "enemy"


window_width = love.graphics.getWidth()
window_height = love.graphics.getHeight()
virtual_width = 232
virtual_height = 115

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  push:setupScreen(virtual_width, virtual_height, window_width, window_height, {
    vsync=false,
    resizable=false,
    fullscreen=false
  })


  enemies = {}
  for i = 1, 100, 1 do 
    table.insert(enemies, enemy()) 
  end

end

function love.update()

  for _, enemy in ipairs(enemies) do
    enemy:update()
  end

end


function love.draw()
  push:start()

  for _, enemy in ipairs(enemies) do
    enemy:render()
  end

  push:finish()
end
