require "src/dependencies"

love.window.setTitle("Project")

love.graphics.setDefaultFilter("nearest", "nearest")
push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
  vsync=false,
  resizable=false,
  fullscreen=false
})

function love.load()


  gStateMachine = StateMachine{
    ["menu"] = function() return menuState() end,
    ["playState"] = function() return playState() end,
    ["gameOverState"] = function() return gameOverState() end,
  }
  gStateMachine:change("menu")

  background = love.graphics.newImage("graphics/background.png")

  donut_texture = love.graphics.newImage("graphics/donut.png")

end

function love.update()

  gStateMachine:update()

end

function love.draw()
  push:start()

  love.graphics.draw(background)
  gStateMachine:render()

  love.graphics.draw(donut_texture, VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2)

  push:finish()
end

