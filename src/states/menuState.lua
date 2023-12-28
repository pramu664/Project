menuState = class{__includes = BaseState}


function menuState:init()
  self.texture = love.graphics.newImage("graphics/mainMenuBackground.png")
end

function menuState:update(dt)
  if love.keyboard.isDown("return") then
    gStateMachine:change("nextLevelState")
    gSounds["select"]:play()
  end
end

function menuState:render()
  love.graphics.draw(self.texture)
  love.graphics.setFont(gFonts["large"])
  love.graphics.printf("PROJECT", 0, VIRTUAL_HEIGHT/5, VIRTUAL_WIDTH, "center")
  love.graphics.setFont(gFonts["small"])
  love.graphics.printf("PRESS START", 0, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, "center")
end
