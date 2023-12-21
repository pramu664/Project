push = require ("push")
particle = require ("particle")
class = require ("class")

require "gun"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
VIRTUAL_WIDTH = 320
VIRTUAL_HEIGHT = 180

love.window.setTitle("Gun shooting experiment")

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync=false,
    resizable=true,
    fullscreen=false
  })

  gGun = gun() -- new

end


function love.update()

  gGun:update() -- new

end


function love.draw()
  push:start()


  gGun:render() -- new


  push:finish()
end
