require "src/constants"
require "src/dependencies"

love.window.setTitle("Bullets")

love.graphics.setDefaultFilter("nearest", "nearest")
push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
  vsync=false,
  resizable=false,
  fullscreen=false
})

function love.load()

  theEnemy = Enemy()
  thePlayer = Player()

end

function love.update()


  theEnemy:update()
  thePlayer:update()

end

function love.draw()
  push:start()

  theEnemy:render()
  thePlayer:render()

  push:finish()
end

