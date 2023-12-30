menuState = class{__includes = BaseState}

function menuState:init()
  self.texture = love.graphics.newImage("graphics/mainMenuBackground.png")
  self.onStart = true
  self.onQuit = false

  gSounds["music"]:play()
  gSounds["music"]:setLooping(true)
end

function menuState:update(dt)

  
  ---[[
  if self.onStart then
    if love.keyboard.isDown("return") then   
        gStateMachine:change("nextLevelState")
        gSounds["select"]:play()
    elseif love.keyboard.isDown("down") then
        self.onStart = false
        self.onQuit = true
        gSounds["select"]:play()
    end
  end

  if self.onQuit then
    if love.keyboard.isDown("return") then
      gSounds["select"]:play()
      love.event.quit()

    elseif love.keyboard.isDown("up") then
      self.onStart = true
      self.onQuit = false
      gSounds["select"]:play()
    end
  end


  --[[if love.keyboard.isDown("return") then
    gStateMachine:change("nextLevelState")
    gSounds["select"]:play()
  end
  --]]

end

function menuState:render()
  love.graphics.draw(self.texture)
  love.graphics.setFont(gFonts["large"])
  love.graphics.printf("PROJECT", VIRTUAL_WIDTH/12, VIRTUAL_HEIGHT/5, VIRTUAL_WIDTH, "left")
  love.graphics.setFont(gFonts["small"])

  if self.onStart then
    love.graphics.setColor({1, 0, 0})
    love.graphics.printf("START", VIRTUAL_WIDTH/12, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, "left")

    love.graphics.setColor({1, 1, 1})
    love.graphics.printf("QUIT", VIRTUAL_WIDTH/12, VIRTUAL_HEIGHT/1.7, VIRTUAL_WIDTH, "left")
  end

  if self.onQuit then
    love.graphics.setColor({1, 1, 1})
    love.graphics.printf("START", VIRTUAL_WIDTH/12, VIRTUAL_HEIGHT/2, VIRTUAL_WIDTH, "left")

    love.graphics.setColor({1, 0, 0})
    love.graphics.printf("QUIT", VIRTUAL_WIDTH/12, VIRTUAL_HEIGHT/1.7, VIRTUAL_WIDTH, "left")
  end

end
