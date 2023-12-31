gameOverState = class{__includes = BaseState}


function gameOverState:init()
  self.texture = love.graphics.newImage("graphics/mainMenuBackground.png")
  print("Gameover state")
end

function gameOverState:update(dt)
  if love.keyboard.isDown("return") then
    gStateMachine:change("playState")
  end
end

function gameOverState:render()
  love.graphics.draw(self.texture)
  love.graphics.setFont(gFonts["large"])
  love.graphics.printf("GAME OVER", 0, VIRTUAL_HEIGHT/5, VIRTUAL_WIDTH, "center")
  love.graphics.setFont(gFonts["small"])
  love.graphics.printf("Enter Restart", 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, "center")
end
