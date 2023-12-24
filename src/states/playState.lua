playState = class{__includes = BaseState}

function playState:init()
  theEnemy = Enemy()
  thePlayer = Player()
end

function playState:update()

  if theEnemy ~= nil then
    theEnemy:update()
  end
  thePlayer:update()

end

function playState:render()

  theEnemy:render()
  thePlayer:render()

end
