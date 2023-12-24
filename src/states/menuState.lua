menuState = class{__includes = BaseState}


function menuState:init()
  self.texture = love.graphics.newImage("graphics/mainMenuBackground.png")
end

function menuState:update(dt)
  if love.keyboard.isDown("return") then
    gStateMachine:change("playState")
  end
end

function menuState:render()
  love.graphics.draw(self.texture)
  love.graphics.printf("My Project", 0, VIRTUAL_HEIGHT/5, VIRTUAL_WIDTH, "center")
  love.graphics.printf("Press Enter to start", 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, "center")
end
