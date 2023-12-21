push = require("push")
particle = require("particle")

VIRTUAL_WIDTH = 320
VIRTUAL_HEIGHT = 180
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

function love.load()
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync=false,
    resizable=true,
    fullscreen=false
  })
  gameX = 0
  gameY = 0
end

function love.update()
  mouseX, mouseY = love.mouse.getPosition()
  -- convert coordinates from screen to game
  gameX, gameY = push:toGame(mouseX, mouseY)
end

function love.draw()
  push:start()

  love.graphics.arc("fill", gameX, gameY, 20, 0, math.pi * 2)

  push:finish()
end
