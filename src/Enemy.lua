Enemy = class{}

gEnemyTransitionTexture = love.graphics.newImage("graphics/enemy_destroy_transition.png")
gEnemyDestroyParticles = love.graphics.newImage("graphics/enemy_destroy_particles.png")

function Enemy:init()

  self.rigidbody = particle:create(VIRTUAL_WIDTH/2, VIRTUAL_HEIGHT/2, math.random(1, 3), math.random(0, math.pi * 2))
  self.texture = love.graphics.newImage("graphics/enemy.png")

  self.x = self.rigidbody.x
  self.y = self.rigidbody.y
  self.width = self.texture:getWidth()
  self.height = self.texture:getHeight()
  self.bounce = -1
  self.health = 3

end

function Enemy:update()

  self.x = self.rigidbody.x
  self.y = self.rigidbody.y

  self.rigidbody:update()

  if self.rigidbody.x + self.width > VIRTUAL_WIDTH then
    self.rigidbody.vx = self.rigidbody.vx * self.bounce
  elseif self.rigidbody.x < 0 then
      self.rigidbody.vx = self.rigidbody.vx * self.bounce
  elseif self.rigidbody.y + self.height > VIRTUAL_HEIGHT then
      self.rigidbody.vy = self.rigidbody.vy * self.bounce
  elseif self.rigidbody.y < 0 then
      self.rigidbody.vy = self.rigidbody.vy * self.bounce
  end

  if utils.rect_in_rect(self, thePlayer) then
    print("Player killed by an enemy")
    gSounds.enemyCollisionPlayer:play()
    gStateMachine:change("gameOverState")
    gStateMachine:change("nextLevelState")
    gCurrentLevel = 1
    ENEMY_COUNT = 2
    print("Change to level 1")
  end

end


function Enemy:render()
  love.graphics.draw(self.texture, self.rigidbody.x, self.rigidbody.y)
end
