playState = class{__includes = BaseState}

function playState:init()
  thePlayer = Player()

  gEnemies = {}
  for i = 1, ENEMY_COUNT, 1 do
    table.insert(gEnemies, Enemy())
  end

  -- new
  gCurrentEnemyCount = ENEMY_COUNT

end

function playState:update()

  for _, enemy in ipairs(gEnemies) do
    enemy:update()
  end

  thePlayer:update()

  if gCurrentEnemyCount == 0 then
    gStateMachine:change("gameOverState")
  end

end

function playState:render()


  for _, enemy in ipairs(gEnemies) do
    enemy:render()
  end

  thePlayer:render()

end
