require "src/constants"
require "src/dependencies"

love.window.setTitle("Box Collision Experiments")

love.graphics.setDefaultFilter("nearest", "nearest")
push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync=false,
    resizable=true,
    fullscreen=false
})


function love.load()

  chest = Box(VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, love.graphics.newImage("graphics/chest.png"))

  player = Box(0, 0, love.graphics.newImage("graphics/player.png"))

end

function love.update()

  mouseX, mouseY = love.mouse:getPosition()
  gameX, gameY = push:toGame(mouseX, mouseY)
  player.x = gameX - player.width/2
  player.y = gameY - player.height/2

  if utils.rect_in_rect(chest, player) then
    print("Detect collision")
  else
    print("No collision")
  end

end

function love.draw()
  push:start()

  chest:render()
  player:render()
  
  push:finish()
end


