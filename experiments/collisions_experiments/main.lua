particle = require("particle")
push = require("push")
utils = require("utils")
class = require("class")

require "circle"


love.window.setTitle("collisions")

VIRTUAL_WIDTH = 160
VIRTUAL_HEIGHT = 90
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720


function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync=false,
    resizable=true,
    fullscreen=false
  })


  -- new
  player = circle(VIRTUAL_WIDTH/4, VIRTUAL_HEIGHT/4)
  player.color = {0, 0, 1}

  c2 = circle()
  c3 = circle(VIRTUAL_WIDTH/3, VIRTUAL_HEIGHT/3)
  c4 = circle(VIRTUAL_WIDTH/1.5, VIRTUAL_HEIGHT/1.5)

  player:addToCollisionDetection(c2)
  player:addToCollisionDetection(c3)
  player:addToCollisionDetection(c4)


end


function love.update()

  mouse_x, mouse_y = love.mouse.getPosition()
  game_x, game_y = push:toGame(mouse_x, mouse_y)
  player.x = game_x
  player.y = game_y

  player:update()

end


function love.draw()
  push:start()

  -- new
  player:render()
  c2:render()
  c3:render()
  c4:render()

  push:finish()
end
