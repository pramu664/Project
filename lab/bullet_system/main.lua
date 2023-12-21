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

  gBullets = {}
  for i = 1, 50, 1 do
    table.insert(gBullets, Projectile())
  end

  theEnemy = Enemy()

end

function love.update()

  for _, bullet in ipairs(gBullets) do

    bullet:update()

  end

  theEnemy:update()

end

function love.draw()
  push:start()

  for _, bullet in ipairs(gBullets) do

    bullet:render()

  end

  theEnemy:render()

  push:finish()
end

