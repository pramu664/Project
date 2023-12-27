nextLevelState = class{__includes = BaseState}

function nextLevelState:init()
  self.texture = love.graphics.newImage("graphics/mainMenuBackground.png")
  print("change to level " .. gCurrentLevel)
end

function nextLevelState:update()

  if love.keyboard.isDown("space") then
    gStateMachine:change("playState")
  end
  
end


function nextLevelState:render()
  love.graphics.draw(self.texture)
  love.graphics.printf("Level " .. gCurrentLevel, 0, VIRTUAL_HEIGHT/5, VIRTUAL_WIDTH, "center")
  love.graphics.printf("Press space to Begin", 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, "center")
end
