playState = class{__includes = BaseState}

gCurrentLevel = 1

function playState:init()
  thePlayer = Player()

  gEnemies = {}
  for i = 1, ENEMY_COUNT, 1 do
    table.insert(gEnemies, Enemy())
  end

  -- new
  gCurrentEnemyCount = ENEMY_COUNT

  -- new
  donut = Item(love.graphics.newImage("graphics/donut.png"))

  print("change to play state")
end

function playState:update()

  for _, enemy in ipairs(gEnemies) do
    enemy:update()
  end

  thePlayer:update()

  if gCurrentEnemyCount == 0 then
    ENEMY_COUNT = ENEMY_COUNT + 1
    gCurrentLevel = gCurrentLevel + 1
    gStateMachine:change("nextLevelState")
    gIsPlayerPickupGun = false
  end

  if donut ~= nil then
    donut:update()
  end

end

function playState:render()

  for _, enemy in ipairs(gEnemies) do
    enemy:render()
  end

  thePlayer:render()

  if donut ~= nil then
    donut:render()
  end

end
