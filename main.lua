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
  }
  gStateMachine:change("menu")

  theEnemy = Enemy()
  thePlayer = Player()

end

function love.update()

  gStateMachine:update()

  if theEnemy ~= nil then
    theEnemy:update()
  end
  thePlayer:update()

end

function love.draw()
  push:start()

  gStateMachine:render()

  theEnemy:render()
  thePlayer:render()

  push:finish()
end

