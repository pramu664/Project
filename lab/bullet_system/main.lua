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
  for i = 1, 100, 1 do
    table.insert(gBullets, Projectile())
  end

end

function love.update()

  for _, bullet in ipairs(gBullets) do
    bullet:update()
  end


end

function love.draw()
  push:start()

  for _, bullet in ipairs(gBullets) do
    bullet:render()
  end

  push:finish()
end
