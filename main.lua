require "src/Dependencies"
require "src/constants"


function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync=false,
    resizable=true,
    fullscreen=false
  })
  love.window.setTitle("Player and Ball")

  gStateMachine = StateMachine{
    ["menu"] = function() return menuState() end,
  }
  gStateMachine:change("menu")

  
  -- new
  backgroundTexture = love.graphics.newImage("graphics/background.png")

  -- new
  gPlayer = player()
  gBall = ball()

end

function love.update(dt)
  gStateMachine:update(dt)


  -- new
  gBall:update()
  gPlayer:update()
  
end

function love.draw()
  push:start()

  -- gStateMachine:render()

  -- new
  love.graphics.draw(backgroundTexture)


  -- new
  gBall:render()
  gPlayer:render()

  push:finish()
end

function love.resize(w, h)
  return push:resize(w, h)
end


