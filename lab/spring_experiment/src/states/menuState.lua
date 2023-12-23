menuState = Class{__includes = BaseState}


function menuState:init()

end

function menuState:update(dt)

end

function menuState:render()
  love.graphics.printf("MENU STATE", 0, VIRTUAL_HEIGHT/6, VIRTUAL_WIDTH, "center")
end
