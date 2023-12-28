require "src/dependencies"

love.window.setTitle("Project")

love.graphics.setDefaultFilter("nearest", "nearest")
push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
  vsync=false,
  resizable=false,
  fullscreen=false
})

function love.load()

  --new temp
  gIsPlayerPickupGun = false

  gStateMachine = StateMachine{
    ["menu"] = function() return menuState() end,
    ["playState"] = function() return playState() end,
    ["gameOverState"] = function() return gameOverState() end,
    ["nextLevelState"] = function() return nextLevelState() end,
  }
  gStateMachine:change("menu")

  background = love.graphics.newImage("graphics/background.png")

  gFonts = {
    ["small"] = love.graphics.newFont("fonts/font.ttf", 8),
    ["medium"] = love.graphics.newFont("fonts/font.ttf", 16),
    ["large"] = love.graphics.newFont("fonts/font.ttf", 32)
  }

  print("Game starts")
end

function love.update()

  gStateMachine:update()

end

function love.draw()
  push:start()

  love.graphics.draw(background)
  gStateMachine:render()

  push:finish()
end

