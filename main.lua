require "src/Dependencies"
require "src/constants"

ballSpeed = 1
offset = 10

function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
    vsync=false,
    resizable=true,
    fullscreen=false
  })
  love.window.setTitle("Hello, world")

  gStateMachine = StateMachine{
    ["menu"] = function() return menuState() end,
  }
  gStateMachine:change("menu")

  
  -- new
  gBallOne = {
    texture = love.graphics.newImage("ball_one.png"),
    rigidbody = particle:create(VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, 0, 0),

  }

  -- new
  gBallTwo = {
    texture = love.graphics.newImage("ball_two.png"),
    rigidbody = particle:create(VIRTUAL_WIDTH/4, VIRTUAL_HEIGHT/4, 0, 0),
  }

  -- new
  gBallOne.rigidbody:addSpring(gBallTwo.rigidbody, 0.001, 5)

  -- new
  backgroundTexture = love.graphics.newImage("background.png")

end

function love.update(dt)
  gStateMachine:update(dt)

  -- new
  gBallOne.rigidbody:update()

  -- player controller
  if love.keyboard.isDown("w") then
    gBallTwo.rigidbody.y = gBallTwo.rigidbody.y - ballSpeed  

  elseif love.keyboard.isDown("a") then
    gBallTwo.rigidbody.x = gBallTwo.rigidbody.x - ballSpeed  

  elseif love .keyboard.isDown("s") then
    gBallTwo.rigidbody.y = gBallTwo.rigidbody.y + ballSpeed  

  elseif love.keyboard.isDown("d") then
    gBallTwo.rigidbody.x = gBallTwo.rigidbody.x + ballSpeed  

  end

  
end

function love.draw()
  push:start()

  -- gStateMachine:render()


  love.graphics.draw(backgroundTexture)

  -- Ball rendering 
  love.graphics.draw(gBallOne.texture, gBallOne.rigidbody.x, gBallOne.rigidbody.y)

  love.graphics.draw(gBallTwo.texture, gBallTwo.rigidbody.x, gBallTwo.rigidbody.y)

  -- love.graphics.line(gBallOne.rigidbody.x + offset, gBallOne.rigidbody.y - offset, gBallTwo.rigidbody.x + offset, gBallTwo.rigidbody.y - offset)


  push:finish()
end

function love.resize(w, h)
  return push:resize(w, h)
end


