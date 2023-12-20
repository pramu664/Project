require "src/Dependencies"
require "src/constants"


love.window.setTitle("Catch me if you can")

love.graphics.setDefaultFilter("nearest", "nearest")
push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
  vsync=false,
  resizable=false,
  fullscreen=false
})


function love.load()

  gStateMachine = StateMachine{
    ["menu"] = function() return menuState() end,
  }
  gStateMachine:change("menu")
  
  backgroundTexture = love.graphics.newImage("graphics/background.png")

  gPlayer = Player()
  gBall = Dog()

  gEnemies = {}
  for i = 1, 10, 1 do 
    table.insert(gEnemies, Enemy())
  end

end

function love.update(dt)

  -- gStateMachine:update(dt)

  gBall:update()
  gPlayer:update()
  
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

  for _, enemy in ipairs(gEnemies) do
    enemy:render()
  end

  push:finish()
end


