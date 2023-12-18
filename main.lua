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

  
  backgroundTexture = love.graphics.newImage("graphics/background.png")

  gPlayer = player()
  gBall = ball()
  gGun = gun()

  -- new
  gEnemies = {}
  for i = 1, 10, 1 do 
    table.insert(gEnemies, enemy())
  end

end

function love.update(dt)
  gStateMachine:update(dt)


  gBall:update()
  gPlayer:update()
  gGun:update()
  
  -- new
  for _, enemy in ipairs(gEnemies) do
    enemy:update()
  end

end

function love.draw()
  push:start()

  -- gStateMachine:render()

  love.graphics.draw(backgroundTexture)


  gBall:render()
  gPlayer:render()
  gGun:render()

  -- new
  for _, enemy in ipairs(gEnemies) do
    enemy:render()
  end

  push:finish()
end

function love.resize(w, h)
  return push:resize(w, h)
end


