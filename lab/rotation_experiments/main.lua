
function love.load()

  plank = {
    x = 50,
    y = 50,
    width = 100,
    height = 20
  }

end

function love.update()

end


function love.draw()

  love.graphics.rectangle("fill", plank.x, plank.y, plank.width, plank.height)

end
